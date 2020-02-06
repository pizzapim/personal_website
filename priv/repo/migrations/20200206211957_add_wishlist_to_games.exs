defmodule PersonalWebsite.Repo.Migrations.AddWishlistToGames do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :wishlist, :boolean, default: false
    end
  end
end
