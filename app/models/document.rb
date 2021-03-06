class Document < ApplicationRecord
  after_commit :broadcast_change

  has_many :locks, -> { active }

  def locked?
    locks.present?
  end

  def unlock
    locks.each do |lock|
      lock.stop
    end
  end

  private

  def broadcast_change
    ActionCable.server.broadcast "document_changes_#{id}", body
  end
end
