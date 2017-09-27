class ChangeUserRecommendedByNullable < ActiveRecord::Migration
  def change
    change_column :users, :recommended_by, :integer, :null => true
  end
end
