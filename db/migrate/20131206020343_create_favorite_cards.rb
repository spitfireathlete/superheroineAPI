class CreateFavoriteCards < ActiveRecord::Migration
  def change
    create_table :favorite_cards do |t|
      t.references :user, index: true
      t.references :card
      t.timestamps
    end
  end
end
