class CreateUsersTable < ActiveRecord::Migration
  def change
  		create_table :users do |item|
  			item.string :username
  			item.string :password
  			item.datetime :created_at
  		end
  end
end
