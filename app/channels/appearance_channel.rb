class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.update(status: true)
    @dm =  current_user
    @online = 'AppearanceChannel'
    AppearanceChannel.broadcast_to @online, @dm
    stream_for AppearanceChannel
  end

  def unsubscribed
    current_user.update(status: false)
  end

end