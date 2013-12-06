class CreateSuperpowers < ActiveRecord::Migration
  def change
    create_table :superpowers do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    
    add_index :superpowers, :name, :unique => true
  end
end
