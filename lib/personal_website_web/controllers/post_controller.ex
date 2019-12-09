defmodule PersonalWebsiteWeb.PostController do
  import Ecto.Query
  use PersonalWebsiteWeb, :controller
  alias PersonalWebsite.{Repo, Post}
  alias PersonalWebsiteWeb.Plugs.AuthenticateAdmin

  plug AuthenticateAdmin when action not in [:show, :index, :project_index]

  def index(%Plug.Conn{path_info: path} = conn, _params) when hd(path) == "projects" do
    posts = Post.projects()
            |> Post.published(AuthenticateAdmin.is_admin?(conn))
            |> Repo.all()

    render(conn, :index, posts: posts, type: "projects")
  end

  def index(conn, _params) do
    posts = Post.all()
            |> Post.published(AuthenticateAdmin.is_admin?(conn))
            |> Repo.all()

    render(conn, :index, posts: posts, type: "posts")
  end

  def show(conn, %{"post_slug" => post_slug}) do
    post = Post.find(post_slug)
           |> Post.published(AuthenticateAdmin.is_admin?(conn))
           |> Repo.one()
    if post do
      render(conn, :show, post: post)
    else
      not_found(conn)
    end
  end

  def new(conn, _opts) do
    changeset = Post.changeset(%Post{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, schema} ->
        render(conn, :show, post: schema)

      {:error, _changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"post_slug" => post_slug}) do
    post = Post.find(post_slug)
           |> Repo.one()
    if post do
      changeset = Post.changeset(post)
      render(conn, :edit, changeset: changeset, post: post)
    else
      not_found(conn)
    end
  end

  def update(conn, %{"post_slug" => post_slug, "post" => post_params}) do
    post = Post.find(post_slug)
           |> Repo.one()
    if post do
      changeset = Post.changeset(post, post_params)

      case Repo.update(changeset) do
        {:ok, schema} ->
          render(conn, :show, post: schema)

        {:error, changeset} ->
          render(conn, :edit, changeset: changeset, post: post)
      end
    else
      not_found(conn)
    end
  end

  def delete(conn, %{"post_slug" => post_slug}) do
    post_id = Post.slug_to_id(post_slug)
    Repo.delete_all(from p in Post, where: p.id == ^post_id)
    redirect(conn, to: "/")
  end

  defp not_found(conn) do
    conn
    |> put_status(:not_found)
    |> put_view(PersonalWebsiteWeb.ErrorView)
    |> render("404.html")
  end
end
