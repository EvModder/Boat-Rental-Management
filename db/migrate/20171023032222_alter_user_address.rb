class AlterUserAddress < ActiveRecord::Migration
      def up
            add_column :users, :address_line1, :string, :limit => 50
            add_column :users, :address_line2, :string, :limit => 50
            add_column :users, :city, :string
            add_column :users, :state, :string
            add_column :users, :zip_code, :string
          end

      def down
            remove_column :users, :address_line1, :string, :limit => 50
            remove_column :users, :address_line2, :string, :limit => 50
            remove_column :users, :city, :string
            remove_column :users, :state, :string
            remove_column :users, :zip_code, :string
          end

    end