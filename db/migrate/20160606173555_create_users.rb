class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :email
      t.integer :age

      t.timestamps null: false
    end
  end
end
