class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreigh_key: true
      t.string :text, limit: 255

      t.timestamps
    end
  end
end
