defmodule PersonalWebsiteWeb.PageController do
  use PersonalWebsiteWeb, :controller

  def front_page(conn, _params) do
    render(conn, "front-page.html")
  end
end
