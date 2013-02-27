class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :barname
      t.integer :zipcode
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
