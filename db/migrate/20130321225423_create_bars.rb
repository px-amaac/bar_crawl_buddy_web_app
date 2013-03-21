class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :bar_name
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
