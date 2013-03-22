class CreateManagerRelationships < ActiveRecord::Migration
  def change
    create_table :manager_relationships do |t|
      t.integer :user_id
      t.integer :bar_id

      t.timestamps
    end

    add_index :manager_relationships, :user_id
    add_index :manager_relationships, :bar_id
    add_index :manager_relationships, [:user_id, :bar_id], unique: true
  end
end
