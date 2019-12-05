defmodule PersonalWebsiteWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :personal_website

  socket "/socket", PersonalWebsiteWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :personal_website,
    gzip: true,
    only: ~w(css fonts images js favicon.ico robots.txt)

  uploads_path = Application.get_env(:personal_website, :uploads_path) |> Path.expand()
  plug Plug.Static,
    at: "/uploads",
    from: uploads_path,
    gzip: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_personal_website_key",
    signing_salt: "Q4W9juHC"

  plug PersonalWebsiteWeb.Router

  @doc """
  Callback invoked for dynamically configuring the endpoint.
  It receives the endpoint configuration and checks if
    configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = Application.get_env(:personal_website, :app_port) ||
        raise("expected the PORT environment variable to be set")
      {:ok, Keyword.put(config, :http, [port: port])}
    else
      {:ok, config}
    end
  end
end
