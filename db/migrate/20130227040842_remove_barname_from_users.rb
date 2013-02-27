class RemoveBarnameFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :barname
  	remove_column :users, :zipcode
  	remove_column :users, :lat
  	remove_column :users, :long

  end

end
