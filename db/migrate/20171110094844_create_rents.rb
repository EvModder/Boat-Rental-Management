class CreateRents < ActiveRecord::Migration
  def up
    create_table :rents do |t|

      t.integer :user_id
      t.text :comments, :limit => 1000
      t.text :date_required
      t.boolean :captainRequired, default: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :rents
  end

end
