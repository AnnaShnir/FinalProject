class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :item

      t.timestamps null: false
    end
  end
end
