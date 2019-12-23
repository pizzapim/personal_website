defmodule PersonalWebsite.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :finished, :boolean, default: false, null: false
      add :finished_at, :date
      add :developer, :string
      add :publisher, :string
      add :platform, :string
      add :released_at, :date

      timestamps()
    end

  end
end
