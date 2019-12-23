defmodule PersonalWebsite.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :developer, :string
    field :finished, :boolean, default: false
    field :finished_at, :date
    field :platform, :string
    field :publisher, :string
    field :released_at, :date
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:title, :finished, :finished_at, :developer, :publisher, :platform, :released_at])
    |> validate_required([:title, :finished, :finished_at, :developer, :publisher, :platform, :released_at])
  end
end
