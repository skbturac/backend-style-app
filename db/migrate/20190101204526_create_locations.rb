class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :stylist_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
