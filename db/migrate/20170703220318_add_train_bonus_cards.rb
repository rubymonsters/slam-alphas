class AddTrainBonusCards < ActiveRecord::Migration
  def change
    add_column :users, :train_bonus_card, :text, array: true, default: []
  end
end
