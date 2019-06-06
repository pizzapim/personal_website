defmodule PersonalWebsiteWeb.PageView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def get_title("about.html", _assigns) do
    LayoutView.get_title("About")
  end
end
