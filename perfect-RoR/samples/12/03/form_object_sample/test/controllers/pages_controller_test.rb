require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get terms" do
    get terms_url
    assert_response :success
  end
end
