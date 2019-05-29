defmodule PersonalWebsiteWeb.Router do
  use PersonalWebsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PersonalWebsiteWeb do
    pipe_through :browser

    get "/", PageController, :front_page
    get "/about", PageController, :about
  end

  scope "/post", PersonalWebsiteWeb do
    pipe_through :browser

    get "/:post", PostController, :show
  end

  scope "/auth", PersonalWebsiteWeb do
    pipe_through :browser

    get "/", AuthController, :new
    post "/", AuthController, :create
  end
end
