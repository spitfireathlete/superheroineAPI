class CreateSuperheroines < ActiveRecord::Migration
  def change
    create_table :superheroines do |t|
      t.string :name, :null => false, :default => ""
      t.string :display_name, :null => false, :default => ""
      t.string :bio
      t.timestamps
    end
    
    add_index :superheroines, :name, :unique => true
  end
end
