class Lock < ApplicationRecord
  belongs_to :document

  scope :active, -> { where("stopped IS NULL OR stopped < ?", 30.minutes.ago)}

  def self.start(options)
    document = Document.find(options[:document_id])
    if document.present?
      Lock.create!(:document_id => document.id, :user_id => options[:user_id])
      ActionCable.server.broadcast "document_locks_#{options[:document_id]}", "#{options[:user_id]} is editing"
    end
  end

  def self.stop(options)
    locks = Lock.where(:document_id => options[:document_id].to_i, :user_id => options[:user_id].to_i)
    locks.each do |lock|
      lock.stop
    end
  end

  def stop
    update!(stopped: Time.now)
  end

  private

  def self.set_started
    self.started = Time.now
  end
end
