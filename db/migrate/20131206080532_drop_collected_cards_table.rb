class DropCollectedCardsTable < ActiveRecord::Migration
  def change
    drop_table :collected_cards
  end
end
