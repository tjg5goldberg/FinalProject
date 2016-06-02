class CreateUserclasssTable < ActiveRecord::Migration
  def change
  	create_table :user_classses do |item|
  		item.integer :user_id
  		item.integer :classs_id
  	end
  end
end
