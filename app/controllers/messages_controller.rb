class MessagesController < ApplicationController

  def index
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to message_path(@message.receiver_id), notice: "success"
    else
      flash.now[:alert] = " failed "
      render "show"
    end
  end

  def show
    @message = Message.new
    @messages = Message.all
  end

  private
   def message_params
     params.require(:message).permit(:body,:receiver_id)
   end

end
