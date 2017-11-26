class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.new_message(@message).deliver_now
      redirect_to contact_path
      flash[:success] = "Sua mensagem de contato foi enviada para rebecacipriano@hotmail.com"
    else
      flash[:danger] = "Ocorreu um erro com sua mensagem."
      redirect_to contact_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
