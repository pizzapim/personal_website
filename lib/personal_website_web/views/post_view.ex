defmodule PersonalWebsiteWeb.PostView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView
  alias PersonalWebsite.Post

  def get_title(template, assigns) do
    cond do
      String.starts_with?(template, "index") ->
        LayoutView.get_title
      String.starts_with?(template, "show") ->
        LayoutView.get_title(Map.get(assigns, :post).title)
      true ->
        LayoutView.get_title
    end
  end
end
