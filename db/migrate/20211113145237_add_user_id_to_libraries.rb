class AddUserIdToLibraries < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries, :user_id, :integer
    add_index :libraries, :user_id
  end
end
