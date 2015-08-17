class CreateOrderParts < ActiveRecord::Migration
  def change
    create_table :order_parts do |t|
      t.references :parttype, index: true
      t.references :order, index: true
      t.float :orderprice

      t.timestamps
    end
  end
end
