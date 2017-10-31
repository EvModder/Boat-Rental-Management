class AddFieldsToDeviseUsers < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string
    add_column :users, :isCaptain, :boolean, default: false

  end

  def down
    remove_column :users, :first_name, :string, null: false, default: ""
    remove_column :users, :last_name, :string
    remove_column :users, :isCaptain, :boolean, default: false
  end
end