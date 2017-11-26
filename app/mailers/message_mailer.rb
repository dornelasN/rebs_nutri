class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_message.subject
  #

  #default from: "contact-message@rebnutri.com"

  def new_message(message)
    @message = message

    mail  from: @message.email,
          to: "ndornelasj@gmail.com",
          subject: "Mensagem de contato pelo website"
  end

end
