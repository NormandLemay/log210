class CreateComptes < ActiveRecord::Migration
  def change
    create_table :comptes do |t|
      t.string :courriel
      t.string :mot_de_passe
      t.integer :client_id

      t.timestamps
    end
  end
end
