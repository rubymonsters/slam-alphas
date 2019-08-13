class AddCustomAvailabilityToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :custom_availability, :text, default: '', null: false
  end
end
