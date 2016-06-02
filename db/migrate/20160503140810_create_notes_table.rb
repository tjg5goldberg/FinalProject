class CreateNotesTable < ActiveRecord::Migration
  def change
  	create_table :notes do |item|
  			item.string :text
  			item.integer :user_id
  			item.integer :classs_id
  		end
  end
end
