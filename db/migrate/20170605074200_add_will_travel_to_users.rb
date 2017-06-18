class AddWillTravelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :will_travel, :string
  end
end
