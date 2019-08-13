class AddAlphaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :alpha, :boolean, default: false, null: false
  end
end
