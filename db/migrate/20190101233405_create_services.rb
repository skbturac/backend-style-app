class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :stylist_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
