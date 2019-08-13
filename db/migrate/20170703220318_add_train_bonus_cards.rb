class AddTrainBonusCards < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :train_bonus_card, :text, array: true, default: []
  end
end
