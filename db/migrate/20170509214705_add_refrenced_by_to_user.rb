class AddRefrencedByToUser < ActiveRecord::Migration
  def change
    add_column :users, :referenced_by, :integer, default: 0,  null: false
  end
end
