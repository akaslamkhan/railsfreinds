class AddUserIdToFreinds < ActiveRecord::Migration[6.1]
  def change
    add_column :freinds, :user_id, :integer
    add_index :freinds, :user_id
  end
end
