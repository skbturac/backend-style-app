class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :service_name
      t.integer :price
      t.integer :service_id


      t.timestamps
    end
  end
end
