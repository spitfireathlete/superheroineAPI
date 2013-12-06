class CreateDeckMembers < ActiveRecord::Migration
  def change
    create_table :deck_members do |t|
      t.references :deck, index: true
      t.references :card
      t.timestamps
    end
  end
end
