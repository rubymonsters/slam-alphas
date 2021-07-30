class AddPronounsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pronouns, :string, default: ''
  end
end
