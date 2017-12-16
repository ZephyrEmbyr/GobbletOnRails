require 'test_helper'

class GameStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_state = game_states(:one)
  end

  test "should get index" do
    get game_states_url
    assert_response :success
  end

  test "should get new" do
    get new_game_state_url
    assert_response :success
  end

  test "should create game_state" do
    assert_difference('GameState.count') do
      post game_states_url, params: { game_state: { blackPieces: @game_state.blackPieces, board: @game_state.board, turn: @game_state.turn, whitePieces: @game_state.whitePieces } }
    end

    assert_redirected_to game_state_url(GameState.last)
  end

  test "should show game_state" do
    get game_state_url(@game_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_state_url(@game_state)
    assert_response :success
  end

  test "should update game_state" do
    patch game_state_url(@game_state), params: { game_state: { blackPieces: @game_state.blackPieces, board: @game_state.board, turn: @game_state.turn, whitePieces: @game_state.whitePieces } }
    assert_redirected_to game_state_url(@game_state)
  end

  test "should destroy game_state" do
    assert_difference('GameState.count', -1) do
      delete game_state_url(@game_state)
    end

    assert_redirected_to game_states_url
  end
end
