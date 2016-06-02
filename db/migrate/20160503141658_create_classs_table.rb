class CreateClasssTable < ActiveRecord::Migration
  def change
  	create_table :classses do |item|
  		item.string :teacher
  		item.string :subject
  	end
  end
end
