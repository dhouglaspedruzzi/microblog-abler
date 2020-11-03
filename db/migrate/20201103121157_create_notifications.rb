class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :message, limit: 255
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
