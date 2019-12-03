defmodule PersonalWebsite.Picture do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  schema "pictures" do
    # field :picture, :string
    field :picture, PersonalWebsite.PictureUploader.Type

    timestamps()
  end

  @doc false
  def changeset(picture, attrs \\ %{}) do
    picture
    |> cast(attrs, [:picture])
    |> validate_required([:picture])
  end
end
