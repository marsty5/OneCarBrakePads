class CreatePartTypes < ActiveRecord::Migration
  def change
    create_table :part_types do |t|
      t.string :name
      t.integer :partno
      t.string :manufacturer
      t.float :price

      t.timestamps
    end
  end
end
