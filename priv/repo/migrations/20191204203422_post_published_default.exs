defmodule PersonalWebsite.Repo.Migrations.PostPublishedDefault do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify :published, :boolean, default: true
    end
  end
end
