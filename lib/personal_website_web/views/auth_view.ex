defmodule PersonalWebsiteWeb.AuthView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def get_title("new.html", _assigns) do
    LayoutView.get_title("Admin Authenticate")
  end
end
