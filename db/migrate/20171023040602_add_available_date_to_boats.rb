class AddAvailableDateToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :available_date, :text
  end
end
