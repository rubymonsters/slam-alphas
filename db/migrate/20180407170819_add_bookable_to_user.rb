class AddBookableToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bookable_as, :text, array: true, default: []
  end
end
