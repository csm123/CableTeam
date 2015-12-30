class DocumentLocksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "document_locks_#{params[:id]}"
  end

  def unsubscribed
    
  end

end