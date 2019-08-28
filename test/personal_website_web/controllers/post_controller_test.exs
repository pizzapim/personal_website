defmodule PersonalWebsiteWeb.PostControllerTest do
  use PersonalWebsiteWeb.ConnCase
  alias PersonalWebsite.{Repo, Post}

  describe "when a post is created" do
    setup [:create_post]

    test "it is visible on the front page", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ ~r/test title/i
    end

    test "it is not visible on the projects page", %{conn: conn} do
      conn = get(conn, "/projects")
      assert html_response(conn, 200) =~ ~r/no projects/i
    end
  end

  describe "when a project is created" do
    setup [:create_project]

    test "it is visible on the front page", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ ~r/test title/i
    end

    test "it is visible on the projects page", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ ~r/test title/i
    end
  end

  defp create_project(context) do
    create_post(context, "project, tags")
  end

  defp create_post(context, tags \\ "post, tags") do
    params = %{
      "title" => "test title 123 **",
      "summary" => "test summary",
      "article" => "test article",
      "tags" => tags
    }

    {:ok, post} = Repo.insert(Post.changeset(%Post{}, params))

    Map.put(context, :post, post)
  end
end
