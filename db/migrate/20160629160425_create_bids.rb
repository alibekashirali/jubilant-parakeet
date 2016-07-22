class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price
      t.datetime :start_date
      t.datetime :end_date
      t.integer :order_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
