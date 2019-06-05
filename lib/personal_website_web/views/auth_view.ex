defmodule PersonalWebsiteWeb.AuthView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView

  def get_title(template, assigns) do
    cond do
      String.starts_with?(template, "new") ->
        LayoutView.get_title("Admin Authenticate")
    end
  end
end
