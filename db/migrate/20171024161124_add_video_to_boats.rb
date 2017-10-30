class AddVideoToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :video, :string
  end
end
