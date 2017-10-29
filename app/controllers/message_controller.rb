class MessageController < ApplicationController
  def show
    begin
      msg_obj = Message.find_by(link: params[:id])
      @message = msg_obj[:text]
      msg_obj.destroy
    rescue
      @message = 'There is no such message'
    end
  end
end
