require 'test_helper'

class BeastControllerTest < ActionDispatch::IntegrationTest
  test "should get get_information" do
    get beast_get_information_url
    assert_response :success
  end

end
