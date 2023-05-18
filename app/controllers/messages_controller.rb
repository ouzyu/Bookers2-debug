class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_room, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      @message = Message.new
      gets_entries_all_messages
    end
  end

  private

  def set_room
    @room = Room.find(params[:message][:room_id])
  end

  def gets_entries_all_messages
    @messages = @room.messages.includes(:user).order("created_at asc")
    @entries = @room.entries
    @another_entry = @entries.where.not(user_id: current_user.id).first
  end

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
