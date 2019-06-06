defmodule PersonalWebsiteWeb.ErrorViewTest do
  use PersonalWebsiteWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(PersonalWebsiteWeb.ErrorView, "404.html", []) =~ ~r/not found/i
  end

  test "renders 500.html" do
    assert render_to_string(PersonalWebsiteWeb.ErrorView, "500.html", []) =~ ~r/Internal Server Error/i
  end
end
