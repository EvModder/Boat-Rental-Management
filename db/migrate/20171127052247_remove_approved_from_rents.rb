class RemoveApprovedFromRents < ActiveRecord::Migration
  def change
    remove_column :rents, :approved, :boolean
  end
end
