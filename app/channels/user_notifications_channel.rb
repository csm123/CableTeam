class UserNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_notifications_#{params[:id]}"
  end

  def unsubscribed
    
  end

end