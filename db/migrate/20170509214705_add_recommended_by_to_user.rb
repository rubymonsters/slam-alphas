class AddRecommendedByToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :recommended_by, :integer, default: 0,  null: false
  end
end
