defmodule PersonalWebsiteWeb.Router do
  use PersonalWebsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PersonalWebsiteWeb do
    pipe_through :browser

    get "/", PostController, :index
    get "/about", PageController, :about

    resources "/posts", PostController, param: "post_slug", except: [:index]

    resources "/projects", PostController, param: "post_slug", name: "project"

    get "/auth", AuthController, :new
    post "/auth", AuthController, :create
    delete "/auth", AuthController, :destroy

    resources "/pictures", PicturesController, only: [:index, :new, :create]
  end
end
