# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  def new_message
    message = Message.first
    MessageMailer.new_message(message)
  end
end

# http://localhost:3000/rails/mailers/message_mailer/new_message