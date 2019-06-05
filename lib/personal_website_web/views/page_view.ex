defmodule PersonalWebsiteWeb.PageView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def get_title(template, _assigns) do
    cond do
      String.starts_with?(template, "about") ->
        LayoutView.get_title("About")
    end
  end
end
