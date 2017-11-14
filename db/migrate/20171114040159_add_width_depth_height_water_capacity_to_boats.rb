class AddWidthDepthHeightWaterCapacityToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :width, :integer
    add_column :boats, :depth, :integer
    add_column :boats, :height, :integer
    add_column :boats, :water, :text
    add_column :boats, :capacity, :integer
  end
end
