require 'test_helper'

class DietTest < ActiveSupport::TestCase

  def setup
    @user = users(:archer)
    
    @diet = Diet.new(picture: "Lorem ipsum picture", user_id: @user.id)
  end

  test "should be valid" do
    assert @diet.valid?
  end

  test "user id should be present" do
    @diet.user_id = nil
    assert_not @diet.valid?
  end

  test "picture should be present" do
    @diet.picture = "    "
    assert_not @diet.valid?
  end
end
