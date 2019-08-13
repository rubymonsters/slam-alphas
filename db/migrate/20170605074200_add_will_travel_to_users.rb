class AddWillTravelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :will_travel, :string
  end
end
