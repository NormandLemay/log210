class AddChampLivreur < ActiveRecord::Migration
  def change
    add_reference :commandes, :livreur, index: true
  end
end
