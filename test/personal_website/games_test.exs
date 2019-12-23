defmodule PersonalWebsite.GamesTest do
  use PersonalWebsite.DataCase

  alias PersonalWebsite.Games

  describe "games" do
    alias PersonalWebsite.Games.Game

    @valid_attrs %{developer: "some developer", finished: true, finished_at: ~D[2010-04-17], platform: "some platform", publisher: "some publisher", released_at: ~D[2010-04-17], title: "some title"}
    @update_attrs %{developer: "some updated developer", finished: false, finished_at: ~D[2011-05-18], platform: "some updated platform", publisher: "some updated publisher", released_at: ~D[2011-05-18], title: "some updated title"}
    @invalid_attrs %{developer: nil, finished: nil, finished_at: nil, platform: nil, publisher: nil, released_at: nil, title: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Games.create_game(@valid_attrs)
      assert game.developer == "some developer"
      assert game.finished == true
      assert game.finished_at == ~D[2010-04-17]
      assert game.platform == "some platform"
      assert game.publisher == "some publisher"
      assert game.released_at == ~D[2010-04-17]
      assert game.title == "some title"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = Games.update_game(game, @update_attrs)
      assert game.developer == "some updated developer"
      assert game.finished == false
      assert game.finished_at == ~D[2011-05-18]
      assert game.platform == "some updated platform"
      assert game.publisher == "some updated publisher"
      assert game.released_at == ~D[2011-05-18]
      assert game.title == "some updated title"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end
end
