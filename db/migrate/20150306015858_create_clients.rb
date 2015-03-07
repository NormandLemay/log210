class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :prenom
      t.date :date_naissance

      t.timestamps
    end
  end
end
