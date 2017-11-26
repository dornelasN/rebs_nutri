require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  
  test 'should get new' do
    get contact_path
    assert_response :success
  end
end
