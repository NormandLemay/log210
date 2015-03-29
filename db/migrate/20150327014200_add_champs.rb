class AddChamps < ActiveRecord::Migration
  def change
    add_reference :commandes, :restaurant, index: true
    add_reference :ligne_commandes, :plat, index: true
    add_reference :ligne_commandes, :commande, index: true
    add_column :commandes, :date, :date
    add_column :commandes, :heure, :time
    add_column :commandes, :status, :string
    add_column :commandes , :livreur_id, :integer
    add_column :commandes, :numero_confirmation, :integer
    add_column :commandes, :total, :integer
    add_column :ligne_commandes, :quantite, :integer

  end
end
