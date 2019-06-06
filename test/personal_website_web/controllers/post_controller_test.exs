defmodule PersonalWebsiteWeb.PostControllerTest do
  use PersonalWebsiteWeb.ConnCase
  alias PersonalWebsite.{Repo, Post}

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ ~r/no posts/i

    post = %{
      "title" => "test title",
      "summary" => "test summary",
      "article" => "test article"
    }

    Repo.insert(Post.changeset(%Post{}, post))

    conn = get(conn, "/")
    assert html_response(conn, 200) =~ ~r/test title/i
  end
end
