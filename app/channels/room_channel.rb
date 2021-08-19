class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room]
    stream_for room
    p ("current_user_#{current_user.id}")

    # or
    # stream_from "room_#{params[:room]}"
  end
end