defmodule PersonalWebsite.Post do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "posts" do
    field :article, :string
    field :title, :string
    field :summary, :string
    field :tags, PersonalWebsite.Tags, default: []
    field :published, :boolean, default: true

    timestamps()
  end

  @doc false
  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, [:title, :article, :summary, :tags, :published])
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

  def slug_to_id(slug) do
    post_id = hd(String.split(slug, "-"))

    case Integer.parse(post_id) do
      {post_id, _rest} -> post_id
      :error -> nil
    end
  end

  def all do
    from p in __MODULE__, order_by: [desc: p.inserted_at]
  end

  def projects do
    from p in all(), where: "project" in type(p.tags, {:array, :string})
  end

  def published(query, true), do: query
  def published(query, _), do: from p in query, where: p.published == true

  def find(slug) when is_binary(slug), do: slug_to_id(slug) |> find()
  def find(id) do
    from p in __MODULE__, where: p.id == ^id
  end
end
