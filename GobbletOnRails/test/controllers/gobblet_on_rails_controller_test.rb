require 'test_helper'

class GobbletOnRailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gobblet_on_rails_index_url
    assert_response :success
  end

end
