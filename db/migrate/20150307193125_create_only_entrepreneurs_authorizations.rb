class CreateOnlyEntrepreneursAuthorizations < ActiveRecord::Migration
  def change
    create_table :only_entrepreneurs_authorizations do |t|

      t.timestamps
    end
  end
end
