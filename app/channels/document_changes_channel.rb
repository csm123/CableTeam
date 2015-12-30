class DocumentChangesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "document_changes_#{params[:id]}"
  end

  def unsubscribed
    
  end

end