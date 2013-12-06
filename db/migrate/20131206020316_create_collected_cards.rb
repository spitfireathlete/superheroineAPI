class CreateCollectedCards < ActiveRecord::Migration
  def change
    create_table :collected_cards do |t|
      t.references :user, index: true
      t.references :card
      t.timestamps
    end
  end
end
