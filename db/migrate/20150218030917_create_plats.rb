class CreatePlats < ActiveRecord::Migration
  def change
    create_table :plats do |t|
      t.integer :menu_id

      t.timestamps
    end
    create_table :description_plats do |t|
      t.string :nom
      t.string :description
      t.float :prix
      t.references :plat, :index=> true

      t.timestamps
    end
  end
end
