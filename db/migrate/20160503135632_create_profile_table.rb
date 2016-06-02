class CreateProfileTable < ActiveRecord::Migration
  def change
  		create_table :profiles do |item|
  			item.string :fname
  			item.string :lname
  			item.integer :user_id
  			item.datetime :created_at
  		end
  end
end
