class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.string :image
      t.text :available_date

      t.timestamps null: false
    end
  end
end
