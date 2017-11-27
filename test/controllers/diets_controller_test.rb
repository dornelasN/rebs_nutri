require 'test_helper'

class DietsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get diet_create_url
    assert_response :success
  end

  test "should get destroy" do
    get diet_destroy_url
    assert_response :success
  end

end
