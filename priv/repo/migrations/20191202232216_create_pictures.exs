defmodule PersonalWebsite.Repo.Migrations.CreatePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :picture, :string

      timestamps()
    end

  end
end
