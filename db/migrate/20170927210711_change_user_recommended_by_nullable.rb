class ChangeUserRecommendedByNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :recommended_by, :integer, :null => true
  end
end
