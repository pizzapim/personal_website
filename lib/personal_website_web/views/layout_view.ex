defmodule PersonalWebsiteWeb.LayoutView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.Endpoint

  def get_title(title) do
    title <> " | " <> get_title()
  end

  def get_title do
    "Pim's Thoughts"
  end
end
