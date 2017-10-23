class AddOwneridPriceLocationToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :ownerid, :integer
    add_column :boats, :price, :integer
    add_column :boats, :location, :text
  end
end
