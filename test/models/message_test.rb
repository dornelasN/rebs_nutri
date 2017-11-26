require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup
    @message = Message.new(name: "User Example", 
                           email: "user-example@email.com", 
                           content: "Message content")
  end
  
  test "should be valid" do
    assert @message.valid?
  end

  test "name should be present and not long" do
    @message.name = ""
    assert_not @message.valid?

    @message.name = "a" *51
    assert_not @message.valid?
  end

  test "email should be present and not long" do
    @message.email = ""
    assert_not @message.valid?

    @message.email = "a" * 244 + "@example.com"
    assert_not @message.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp 
                          alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @message.email = valid_address
      assert @message.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    valid_addresses = %w[user@example,com USER_at_foo.com user.name@example. foo@bar_baz.com 
                          foo@bar+baz.com maike@bob..com]
    valid_addresses.each do |valid_address|
      @message.email = valid_address
      assert_not @message.valid?, "#{valid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "FoO@ExaMpLe.COm"
    @message.email = mixed_case_email
    @message.save
    assert_equal mixed_case_email.downcase, @message.reload.email
  end

  test "message content should be present" do
    @message.content = " "
    assert_not @message.valid?
  end
end
