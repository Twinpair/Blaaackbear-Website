class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      # MessageMailer.send_message(@message).deliver_now
      flash[:success] = "Message Received! I will be in touch with you soon."
      redirect_to "/#contact"
    else
      if message_params["name"].blank? || message_params["email"].blank? || message_params["message"].blank?
        flash[:danger] = "ERROR=- Required field was left blank"
      end 
      redirect_to "/#contact"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :message)
  end
  
end
