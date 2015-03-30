class Livreurs < ActiveRecord::Migration
  def change
    add_column :livreurs, :coordonnee, :string
  end
end
