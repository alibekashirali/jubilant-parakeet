class AddLoadingToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :loading, :string
    add_column :orders, :unloading, :string
    
    add_column :orders, :passenger, :string
    add_column :orders, :for, :string
    add_column :orders, :rush_order, :boolean
    add_column :orders, :packaging, :boolean
    add_column :orders, :loader, :boolean
    add_column :orders, :round_trip, :boolean
  end
end
