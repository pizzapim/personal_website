defmodule PersonalWebsiteWeb.PostView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView
  alias PersonalWebsite.Post

  def get_title("index.html", _assigns) do
    LayoutView.get_title
  end

  def get_title("show.html", assigns) do
    LayoutView.get_title(Map.get(assigns, :post).title)
  end

  def get_title(_template, _assigns) do
    LayoutView.get_title
  end
end
