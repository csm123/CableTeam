class DocumentEditingChannel < ApplicationCable::Channel
  def subscribed
    Lock.start(:document_id => params[:id], :user_id => current_user)
  end

  def unsubscribed
    Lock.stop(:document_id => params[:document_id], :user_id => current_user)
  end
end