class AddChamp < ActiveRecord::Migration
  def change
    add_column :comptes, :restaurateur_id, :integer
    remove_column :restaurateurs, :courriel, :string

  end
end
