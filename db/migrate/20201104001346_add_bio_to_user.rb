class AddBioToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :string, limit: 180
  end
end
