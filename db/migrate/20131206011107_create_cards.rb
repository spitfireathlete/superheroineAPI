class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, :null => false, :default => ""
      t.string :display_name, :null => false, :default => ""
      t.string :title
      t.string :bio
      t.string :facts
      t.string :advice
      t.string :quotes
      t.integer :num_favorites, :null => false, :default => 0
      t.integer :num_shares, :null => false, :default => 0
      t.timestamps
    end
    
    add_index :cards, :name, :unique => true
  end
end
