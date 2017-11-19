class AddApprovedToRents < ActiveRecord::Migration
  def change
    add_column :rents, :approved, :boolean
  end
end
