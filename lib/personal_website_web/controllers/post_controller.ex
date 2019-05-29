defmodule PersonalWebsiteWeb.PostController do
  import Ecto.Query
  use PersonalWebsiteWeb, :controller
  alias PersonalWebsite.{Repo, Post}

  plug PersonalWebsiteWeb.Plugs.AuthenticateAdmin when action not in [:show]

  def show(conn, %{"post_id" => post_id}) do
    post = Repo.one(from p in Post, where: p.id == ^post_id)
    if post do
      render(conn, :show, post: post)
    else
      conn
      |> put_status(:not_found)
      |> put_view(PersonalWebsiteWeb.ErrorView)
      |> render("404.html")
    end
  end

  def new(conn, _opts) do
    changeset = Post.changeset(%Post{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)
    case Repo.insert(changeset) do
      {:ok, schema} -> render(conn, :show, post: schema)
      {:error, _changeset} -> render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"post_id" => post_id}) do
    post = Repo.one(from p in Post, where: p.id == ^post_id)
    if post do
      changeset = Post.changeset(post)
      render(conn, :edit, changeset: changeset, post: post)
    else
      conn
      |> put_status(:not_found)
      |> put_view(PersonalWebsiteWeb.ErrorView)
      |> render("404.html")
    end
  end

  def update(conn, %{"post_id" => post_id, "post" => post_params}) do
    # require IEx; IEx.pry
    post = Repo.one(from p in Post, where: p.id == ^post_id)
    if post do
      changeset = Post.changeset(post, post_params)
      case Repo.update(changeset) do
        {:ok, schema} -> render(conn, :show, post: schema)
        {:error, changeset} -> render(conn, :edit, changeset: changeset, post: post)
      end
    else
      conn
      |> put_status(:not_found)
      |> put_view(PersonalWebsiteWeb.ErrorView)
      |> render("404.html")
    end
  end
end
