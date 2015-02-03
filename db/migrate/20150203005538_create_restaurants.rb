class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :nom
      t.integer :restaurateur_id
      t.integer :coords_id

      t.timestamps
    end
  end
end
