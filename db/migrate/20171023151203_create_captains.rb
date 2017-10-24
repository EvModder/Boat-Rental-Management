class CreateCaptains < ActiveRecord::Migration
    def change
        create_table :captains do |t|

          t.integer "age", :limit => 5
          t.integer "year_experience", :limit => 5
          t.text "comments", :limit => 1000
          t.date "first_available_date"
          t.time "monday_availability"
          t.time "tuesday_availability"
          t.time "wednesday_availability"
          t.time "thurdsay_availability"
          t.time "friday_availability"
          t.time "saturday_availability"
          t.time "sunday_availability"

          t.boolean "monday" ,default: false
          t.boolean "tuesday" ,default: false
          t.boolean "wednesday" ,default: false
          t.boolean "thursday" ,default: false
          t.boolean "friday" ,default: false
          t.boolean "saturday" ,default: false
          t.boolean "sunday" ,default: false

          t.timestamps null: false

        end
    end

    def down
        drop_table :captains
      end
  end