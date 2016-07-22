class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :name
      t.string :body_type
      t.string :capacity

      t.timestamps null: false
    end
  end
end
