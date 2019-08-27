defmodule PersonalWebsite.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :article, :string
    field :title, :string
    field :summary, :string
    field :tags, PersonalWebsite.Tags, default: []

    timestamps()
  end

  @doc false
  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, [:title, :article, :summary, :tags])
    |> validate_required([:title, :article, :summary])
  end

  def get_slug(post) do
    title = post.title
    |> String.downcase
    |> String.replace(~r/[^a-z\d\s]/, "")
    |> String.replace_suffix(" ", "")
    |> String.replace(~r/\s/, "-")

    Integer.to_string(post.id) <> "-" <> title
  end
end
