class CreateSharedCards < ActiveRecord::Migration
  def change
    create_table :shared_cards do |t|
      t.references :user, index: true
      t.references :card
      t.integer :platformType # facebook, twitter or pintrest
      t.timestamps
    end
  end
end
