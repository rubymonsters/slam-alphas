class AddRecommendedByToUser < ActiveRecord::Migration
  def change
    add_column :users, :recommended_by, :integer, default: 0,  null: false
  end
end
