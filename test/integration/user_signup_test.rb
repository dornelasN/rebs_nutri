require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" }}
    end
    
    #test to make sure the new users page is rendered and the messages containers exist
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
    assert_select 'form'
  end

  test "valid signup information with account activation" do 
    get signup_path
    assert_difference 'User.count', 1 do 
      post users_path, params: { user: {  name: "Valid User",
                                          email: "user@valid.com",
                                          password: "password",
                                          password_confirmation: "password" } }
    end

    # Verify that exactly one message was delivered
    assert_equal 1, ActionMailer::Base.deliveries.size
    # assigns gives access to the @user instance variable in this action
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation
    log_in_as(user)
    assert_not is_logged_in?

    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?

    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?

    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    # arrange to follow redirect after form submission: rendering 'users/show'
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
