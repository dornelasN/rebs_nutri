require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "new_message" do
    message = messages(:one)
    mail = MessageMailer.new_message(message)
    assert message.valid?
    assert_equal "Mensagem de contato pelo website", mail.subject
    assert_equal ["ndornelasj@gmail.com"], mail.to
    assert_equal ["contact-message@rebnutri.com"], mail.from
    assert_match message.name,    mail.body.encoded
    assert_match message.email,   mail.body.encoded
    assert_match message.content, mail.body.encoded
  end
end
