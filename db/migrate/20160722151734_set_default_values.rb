class SetDefaultValues < ActiveRecord::Migration
  def change
    change_column_default :orders, :width, 0
    change_column_default :orders, :height, 0
    change_column_default :orders, :length, 0
  end
end
