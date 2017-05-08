class AddVideoLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :video_link, :text
  end
end
