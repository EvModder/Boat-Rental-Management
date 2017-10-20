class CreateBoatAttachments < ActiveRecord::Migration
  def change
    create_table :boat_attachments do |t|
      t.integer :boat_id
      t.string :image

      t.timestamps null: false
    end
  end
end
