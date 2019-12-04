defmodule PersonalWebsiteWeb.Plugs.AuthenticateAdmin do
  alias PersonalWebsiteWeb.Router.Helpers, as: Routes
  alias PersonalWebsiteWeb.Endpoint

  def init([]), do: false

  def call(conn, _opts) do
    if is_admin(conn) do
      conn
    else
      Phoenix.Controller.redirect(conn, to: Routes.auth_path(Endpoint, :new))
    end
  end

  def is_admin(conn) do
    Plug.Conn.get_session(conn, "is_admin")
  end
end
