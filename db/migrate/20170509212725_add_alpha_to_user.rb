class AddAlphaToUser < ActiveRecord::Migration
  def change
    add_column :users, :alpha, :boolean, default: false, null: false
  end
end
