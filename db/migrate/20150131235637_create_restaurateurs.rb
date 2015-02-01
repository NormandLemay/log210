class CreateRestaurateurs < ActiveRecord::Migration
  def change
    create_table :restaurateurs do |t|
      t.string :nom
      t.string :courriel

      t.timestamps
    end
  end
end
