defmodule PersonalWebsiteWeb.GameView do
  use PersonalWebsiteWeb, :view
  alias PersonalWebsiteWeb.LayoutView
  alias PersonalWebsite.Game

  def get_title("index.html", _) do
    LayoutView.get_title("Games")
  end

  def get_title("new.html", _) do
    LayoutView.get_title("New game")
  end

  def get_title("show.html", _) do
    LayoutView.get_title("View game")
  end

  def get_title("edit.html", _) do
    LayoutView.get_title("Edit game")
  end
end
