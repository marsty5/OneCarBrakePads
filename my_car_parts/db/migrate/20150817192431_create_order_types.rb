class CreateOrderTypes < ActiveRecord::Migration
  def change
    create_table :order_types do |t|
      t.reference :parttype
      t.references :order, index: true
      t.float :price

      t.timestamps
    end
  end
end
