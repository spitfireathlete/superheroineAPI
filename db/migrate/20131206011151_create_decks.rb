class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    
    add_index :decks, :name, :unique => true
  end
end
