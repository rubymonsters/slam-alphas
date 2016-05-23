class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :city
      t.string :country
      t.string :email
      t.integer :age

      t.timestamps null: false
    end
  end
end
