class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :nom
      t.string :description
      t.float :prix
      t.integer :menu_id

      t.timestamps
    end
  end
end
