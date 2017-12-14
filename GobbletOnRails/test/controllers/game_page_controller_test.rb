require 'test_helper'

class GamePageControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get game_page_play_url
    assert_response :success
  end

end
