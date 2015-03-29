class CreateLigneCommandes < ActiveRecord::Migration
  def change
    create_table :ligne_commandes do |t|

      t.timestamps
    end
  end
end
