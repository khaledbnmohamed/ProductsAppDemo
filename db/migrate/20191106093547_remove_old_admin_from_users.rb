class RemoveOldAdminFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_admin, :bool
  end
end
