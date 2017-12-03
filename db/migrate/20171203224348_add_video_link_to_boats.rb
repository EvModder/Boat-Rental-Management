class AddVideoLinkToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :video_link, :text
  end
end
