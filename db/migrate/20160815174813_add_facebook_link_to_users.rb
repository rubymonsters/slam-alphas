class AddFacebookLinkToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facebook_link, :string
  end
end
