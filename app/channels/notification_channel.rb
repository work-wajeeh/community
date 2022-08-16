class NotificationChannel < ApplicationCable::Channel
  def subscribed
    puts '********************************'
    puts params[:user_id]
    puts '********************************'
    stream_from "notification_channel_#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
