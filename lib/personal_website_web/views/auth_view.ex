defmodule PersonalWebsiteWeb.AuthView do
  use PersonalWebsiteWeb, :view

  def is_admin?(conn) do
    Plug.Conn.get_session(conn, "is_admin")
  end
end
