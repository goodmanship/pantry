class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :placed_at
      t.integer :placed_by

      t.timestamps
    end
  end
end
