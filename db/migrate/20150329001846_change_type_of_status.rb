class ChangeTypeOfStatus < ActiveRecord::Migration
  def change
    change_column :commandes, :status, :integer
  end
end
