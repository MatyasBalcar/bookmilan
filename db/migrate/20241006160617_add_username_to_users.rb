class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_name, :text
  end
end
