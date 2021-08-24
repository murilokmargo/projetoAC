class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room]
    stream_for room
    p ("current_user_#{current_user.id}")
    p ("Sala atual: #{room.id}")
    current_user.status = true
    p(current_user.status)
    # or
    # stream_from "room_#{params[:room]}"
  end
end