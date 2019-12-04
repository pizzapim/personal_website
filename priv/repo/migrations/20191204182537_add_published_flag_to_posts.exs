defmodule PersonalWebsite.Repo.Migrations.AddPublishedFlagToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :published, :boolean, default: false
    end
  end
end
