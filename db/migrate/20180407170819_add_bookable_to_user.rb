class AddBookableToUser < ActiveRecord::Migration
  def change
    add_column :users, :bookable_as, :text, array: true, default: []
  end
end
