class AddVolumeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :volume, :integer
  end
end
