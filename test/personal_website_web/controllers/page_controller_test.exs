defmodule PersonalWebsiteWeb.PageControllerTest do
  use PersonalWebsiteWeb.ConnCase

  describe "when a user visits the about page" do
    test "the page loads correctly", %{conn: conn} do
      conn = get(conn, "/about")
      assert html_response(conn, 200) =~ ~r/welcome to my website/i
    end
  end
end
