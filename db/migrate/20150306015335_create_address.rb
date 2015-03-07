class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :rue
      t.integer :no_civic
      t.string :ville
      t.string :pays
      t.string :code_postal
      t.string :province
      t.integer :client_id

      t.timestamps
    end
  end
end
