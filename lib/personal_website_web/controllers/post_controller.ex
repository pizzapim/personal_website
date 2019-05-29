defmodule PersonalWebsiteWeb.PostController do
  import Ecto.Query
  use PersonalWebsiteWeb, :controller
  alias PersonalWebsite.{Repo, Post}

  plug PersonalWebsiteWeb.Plugs.AuthenticateAdmin when action not in [:show]

  def show(conn, %{"post_slug" => post_slug}) do
    post = find_post(conn, post_slug)
    render(conn, :show, post: post)
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
    post = find_post(conn, post_slug)
    changeset = Post.changeset(post)
    render(conn, :edit, changeset: changeset, post: post)
  end

  def update(conn, %{"post_slug" => post_slug, "post" => post_params}) do
    post = find_post(conn, post_slug)
    changeset = Post.changeset(post, post_params)
    case Repo.update(changeset) do
      {:ok, schema} ->
        render(conn, :show, post: schema)
      {:error, changeset} ->
        render(conn, :edit, changeset: changeset, post: post)
    end
  end

  def destroy(conn, %{"post_slug" => post_slug}) do
    post_id = get_post_id_from_slug(post_slug)
    Repo.delete_all(from p in Post, where: p.id == ^post_id)
    redirect(conn, to: "/")
  end

  defp find_post(conn, post_slug) do
    post = if post_id = get_post_id_from_slug(post_slug) do
      Repo.one(from p in Post, where: p.id == ^post_id)
    end

    if post do
      post
    else
      conn
      |> put_status(:not_found)
      |> put_view(PersonalWebsiteWeb.ErrorView)
      |> render("404.html")
    end
  end

  defp get_post_id_from_slug(post_slug) do
    post_id = hd(String.split(post_slug, "-"))

    case Integer.parse(post_id) do
      {post_id, _rest} -> post_id
      :error -> false
    end
  end
end
