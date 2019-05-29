defmodule PersonalWebsiteWeb.PageController do
  use PersonalWebsiteWeb, :controller

  def about(conn, _params) do
    render(conn, "about.html")
  end
end
