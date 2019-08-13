class ChangeAgeToYearOfBirth < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :age, :year_of_birth
  end
end
