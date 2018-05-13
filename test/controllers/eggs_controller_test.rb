require 'test_helper'

class EggsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_by_address" do
    get eggs_get_by_address_url
    assert_response :success
  end

end
