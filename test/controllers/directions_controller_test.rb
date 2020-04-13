require 'test_helper'

class DirectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get directions_index_url
    assert_response :success
  end

end
