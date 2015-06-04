class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :type_of_activity
      t.string :description
      t.string :location
      t.string :image_url

      t.timestamps null: false
    end
  end
end
