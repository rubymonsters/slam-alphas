class AddTravelsViaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :travels_via, :text, array: true, default: []
  end
end
