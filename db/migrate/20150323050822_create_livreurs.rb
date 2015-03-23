class CreateLivreurs < ActiveRecord::Migration
  def change
    create_table :livreurs do |t|
      t.string :nom
      t.string :prenom

      t.timestamps
    end
    add_column :comptes, :livreur_id, :integer
  end
end