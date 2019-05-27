defmodule PersonalWebsiteWeb.PostController do
  import Ecto.Query
  use PersonalWebsiteWeb, :controller
  alias PersonalWebsite.{Repo, Post}

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
end
