class CreateLivreurs < ActiveRecord::Migration
  def change
    create_table :livreurs do |t|
      t.string :nom
      t.string :prenom

      t.timestamps
    end
  end
end
