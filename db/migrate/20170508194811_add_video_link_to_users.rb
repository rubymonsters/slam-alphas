class AddVideoLinkToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :video_link, :text
  end
end
