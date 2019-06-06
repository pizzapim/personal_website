defmodule PersonalWebsiteWeb.AuthView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def get_title("new.html", assigns) do
    LayoutView.get_title("Admin Authenticate")
  end
end
