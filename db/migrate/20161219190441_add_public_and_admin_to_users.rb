class AddPublicAndAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :public, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
