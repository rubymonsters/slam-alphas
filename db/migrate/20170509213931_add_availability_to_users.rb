class AddAvailabilityToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_available_on, :string
  end

  def down
    remove_column :users, :is_available_on
  end

end
