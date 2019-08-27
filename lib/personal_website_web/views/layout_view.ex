defmodule PersonalWebsiteWeb.LayoutView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.Router.Helpers, as: Routes

  def get_title(title) do
    title <> " | " <> get_title()
  end

  def get_title do
    "Pim's Thoughts"
  end

  def post_path(conn, method, post \\ nil)
  def post_path(%Plug.Conn{path_info: path} = conn, method, post) when hd(path) == "projects" do
    if post do
      Routes.project_path(conn, method, post)
    else
      Routes.project_path(conn, method)
    end
  end

  def post_path(conn, method, post) do
    if post do
      Routes.post_path(conn, method, post)
    else
      Routes.post_path(conn, method)
    end
  end
end
