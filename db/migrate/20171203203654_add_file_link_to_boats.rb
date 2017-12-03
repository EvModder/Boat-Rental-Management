class AddFileLinkToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :file_link, :text
  end
end
