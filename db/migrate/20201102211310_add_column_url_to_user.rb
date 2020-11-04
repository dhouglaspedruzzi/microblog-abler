class AddColumnUrlToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :url, :string, limit: 255
    add_index :users, :url, unique: true
  end
end
