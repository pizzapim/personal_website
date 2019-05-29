defmodule PersonalWebsiteWeb.Plugs.AuthenticateAdmin do
  def init([]), do: false

  def call(conn, _opts) do
    if Plug.Conn.get_session(conn, "is_admin") do
      conn
    else
      Phoenix.Controller.redirect(conn, to: "/")
    end
  end
end
