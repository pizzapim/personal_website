defmodule PersonalWebsiteWeb.PicturesController do
  use PersonalWebsiteWeb, :controller
  alias PersonalWebsite.{Repo, Picture}

  plug PersonalWebsiteWeb.Plugs.AuthenticateAdmin

  def index(conn, _params) do
    pictures = Repo.all(Picture)
    render(conn, :index, pictures: pictures)
  end

  def new(conn, _params) do
    changeset = Picture.changeset(%Picture{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"picture" => picture_params}) do
    changeset = Picture.changeset(%Picture{}, picture_params)

    case Repo.insert(changeset) do
      {:ok, _picture} ->
        conn
        |> put_flash(:info, "Image was added")
        |> redirect(to: Routes.pictures_path(conn, :index))
      {:error, changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:error, "Something went wrong")
        |> render("new.html", changeset: changeset)
    end
  end
end
