class AddBoatidToRents < ActiveRecord::Migration
  def change
    add_column :rents, :boat_id, :integer
  end
end
