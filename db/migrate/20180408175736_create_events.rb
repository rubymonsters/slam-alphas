class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :url
      t.string :city
      t.integer :user_id
      t.integer :relationship
      t.timestamps null: false
    end
  end
end
