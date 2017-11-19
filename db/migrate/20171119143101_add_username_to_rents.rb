class AddUsernameToRents < ActiveRecord::Migration
  def change
    add_column :rents, :user_name, :string
  end
end
