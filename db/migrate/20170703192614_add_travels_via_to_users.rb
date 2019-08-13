class AddTravelsViaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :travels_via, :text, array: true, default: []
  end
end
