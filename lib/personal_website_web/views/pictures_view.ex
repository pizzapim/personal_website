defmodule PersonalWebsiteWeb.PicturesView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def get_title("new.html", _assigns) do
    LayoutView.get_title("Add picture")
  end

  def get_title("index.html", _assigns) do
    LayoutView.get_title("Uploaded pictures")
  end
end
