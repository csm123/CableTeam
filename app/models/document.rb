class Document < ApplicationRecord
  after_commit :broadcast_change

  private

  def broadcast_change
    ActionCable.server.broadcast "document_changes_#{id}", body
  end
end
