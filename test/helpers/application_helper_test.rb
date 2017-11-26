require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Rebs Nutri"
    assert_equal full_title("Help"), "Help | Rebs Nutri"
  end
end