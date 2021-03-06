defmodule PersonalWebsiteWeb.PostTest do
  use PersonalWebsite.DataCase
  alias PersonalWebsite.{Repo, Post}

  describe "posts:" do
    setup [:create_post]

    test "the slug is correctly generated", %{post: post} do
      assert Post.get_slug(post) == "#{post.id}-test-title-123"
    end

    test "tags are correctly parsed", %{post: %Post{tags: tags}} do
      assert Enum.sort(tags) == ["tags", "test123"]
    end
  end

  defp create_post(context) do
    params = %{
      "title" => "test title 123 **",
      "summary" => "test summary",
      "article" => "test article",
      "tags" => "test123, Tags"
    }

    {:ok, post} = Repo.insert(Post.changeset(%Post{}, params))

    Map.put(context, :post, post)
  end
end
