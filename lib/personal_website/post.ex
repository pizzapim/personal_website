defmodule PersonalWebsite.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :article, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, [:title, :article])
    |> validate_required([:title, :article])
  end

  def get_slug(post) do
    title = post.title
    |> String.downcase
    |> String.replace(~r/[^a-z\d\s]/, "")
    |> String.replace(~r/\s/, "-")

    Integer.to_string(post.id) <> "-" <> title
  end
end
