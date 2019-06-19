class RemoveAdminFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin
    add_column :users, :permission_type, :integer, default: 0
  end
end
