class MessagesController < ApplicationController
respond_to :js

  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    respond_with @message
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:email, :body)
    end
end
