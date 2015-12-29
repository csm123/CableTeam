class CreateLocks < ActiveRecord::Migration[5.0]
  def change
    create_table :locks do |t|
      t.integer :user_id
      t.integer :document_id
      t.datetime :started
      t.datetime :stopped
      t.timestamps
    end
  end
end
