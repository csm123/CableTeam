class Lock < ApplicationRecord
  belongs_to :document

  def self.start(options)
    document = Document.find(options[:document_id])
    if document.present?
      Lock.create!(:document_id => document.id, :user_id => options[:user_id])
    end
  end

  private

  def self.set_started
    self.started = Time.now
  end
end
