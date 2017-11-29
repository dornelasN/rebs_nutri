require 'test_helper'

class DietTest < ActiveSupport::TestCase

  def setup
    @user = users(:nelson)
    @diet = @user.diets.build(picture: "some picture")
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

  test "order should be most recent first" do
    assert_equal diets(:most_recent), Diet.first
  end

  test "associated diets should be destroyed" do
    #@user.save
    @user.diets.create!(picture: "Lorem ipsum")
    assert_difference 'Diet.count', -1 do
      @user.destroy
    end
  end
end
