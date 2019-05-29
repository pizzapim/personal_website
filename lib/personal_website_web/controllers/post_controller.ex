defmodule PersonalWebsiteWeb.PostController do
  import Ecto.Query
  use PersonalWebsiteWeb, :controller
  alias PersonalWebsite.{Repo, Post}

  plug PersonalWebsiteWeb.Plugs.AuthenticateAdmin when not action in [:show]

  def show(conn, %{"post" => post_id}) do
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

  def create(conn, params) do
    changeset = Post.changeset(%Post{}, params["post"])
    case Repo.insert(changeset) do
      {:error, _changeset} -> render(conn, :new, changeset: changeset)
      {:ok, schema} -> render(conn, :show, post: schema)
    end
  end
end
