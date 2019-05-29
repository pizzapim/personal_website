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
end
