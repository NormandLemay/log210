class AddRestaurantIdDansAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :restaurant, index: true
  end
end
