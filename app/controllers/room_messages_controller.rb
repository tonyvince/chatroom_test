class RoomMessagesController < ApplicationController
  def create
    @message = current_user.room_messages.create(message: permitted_parameters[:message], room_id: params[:room_id])
  end

  protected

  def permitted_parameters
    params.require(:room_message).permit(:message)
  end
end
