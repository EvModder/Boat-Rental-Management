class AddStateCityToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :state, :text
    add_column :boats, :city, :text
  end
end
