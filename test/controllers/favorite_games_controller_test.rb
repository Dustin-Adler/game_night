require 'test_helper'

class FavoriteGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_game = favorite_games(:one)
  end

  test "should get index" do
    get favorite_games_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_game_url
    assert_response :success
  end

  test "should create favorite_game" do
    assert_difference('FavoriteGame.count') do
      post favorite_games_url, params: { favorite_game: { game_id: @favorite_game.game_id, user_id: @favorite_game.user_id } }
    end

    assert_redirected_to favorite_game_url(FavoriteGame.last)
  end

  test "should show favorite_game" do
    get favorite_game_url(@favorite_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_game_url(@favorite_game)
    assert_response :success
  end

  test "should update favorite_game" do
    patch favorite_game_url(@favorite_game), params: { favorite_game: { game_id: @favorite_game.game_id, user_id: @favorite_game.user_id } }
    assert_redirected_to favorite_game_url(@favorite_game)
  end

  test "should destroy favorite_game" do
    assert_difference('FavoriteGame.count', -1) do
      delete favorite_game_url(@favorite_game)
    end

    assert_redirected_to favorite_games_url
  end
end
