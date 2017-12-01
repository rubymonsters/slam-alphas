class AddCustomAvailabilityToUser < ActiveRecord::Migration
  def change
    add_column :users, :custom_availability, :text, default: '', null: false
  end
end
