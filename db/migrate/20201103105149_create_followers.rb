class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :user, foreigh_key: true
      t.references :follower, foreigh_key: true

      t.timestamps
    end
    add_index :followers, [:user_id, :follower_id], unique: true
  end
end
