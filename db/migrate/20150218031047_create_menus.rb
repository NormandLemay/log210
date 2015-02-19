class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :nom
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
