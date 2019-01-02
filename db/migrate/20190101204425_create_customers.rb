class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.integer :locations_id

      t.timestamps
    end
  end
end
