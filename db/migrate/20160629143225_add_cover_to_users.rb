class AddCoverToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :avatar
    add_attachment :orders, :cargo_picture
  end
  def down
    remove_attachment :users, :avatar
    remove_attachment :orders, :cargo_picture
  end
end
