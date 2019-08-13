class AddAvailabilityToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :is_available_on, :text, array: true, default: []
  end

  def down
    remove_column :users, :is_available_on
  end

end
