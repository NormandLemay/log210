class AjoutChampAdresse < ActiveRecord::Migration
  def change
    add_reference :commandes, :address, index: true
  end
end
