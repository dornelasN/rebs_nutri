require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:nelson)
  end

  test "unsuccessful edits" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select 'div.alert', "The form contains 4 errors."
  end

  test "successful edit with friendly forwarding" do
    # edit_user_path page request
    get edit_user_path(@user)
    # user is not logged_in, so requested URL is stored in session[:forwarding_url]
    log_in_as(@user)
    # user is now logged_in, and should be redirected to the stored URL in session[:forwarding_url]
    assert_redirected_to edit_user_url(@user)
    # after being redirected, the session[:forwarding_url] should be nil

    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email

    #on subsequenet login attempts, user should be redirected to their profile page
    assert_nil session[:forwarding_url]
    log_in_as(@user)
    assert_redirected_to user_url(@user)
  end
end