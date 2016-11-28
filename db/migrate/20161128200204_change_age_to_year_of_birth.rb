class ChangeAgeToYearOfBirth < ActiveRecord::Migration
  def change
  	rename_column :users, :age, :year_of_birth
  end
end
