class AddPictureToTransports < ActiveRecord::Migration
  def up
    add_attachment :transports, :picture
  end
  def down
    remove_attachment :transports, :picture
  end
end
