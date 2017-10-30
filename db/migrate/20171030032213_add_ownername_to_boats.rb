class AddOwnernameToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :owner_name, :string
  end
end
