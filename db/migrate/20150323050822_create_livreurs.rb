class CreateLivreurs < ActiveRecord::Migration
  def change
    create_table :livreurs do |t|
      t.string :nom
      t.string :prenom
      t.string :coordonnee
      t.timestamps
    end
    add_column :comptes, :livreur_id, :integer
    add_column :addresses, :livreur_id, :integer
  end
end