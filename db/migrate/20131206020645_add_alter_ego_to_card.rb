class AddAlterEgoToCard < ActiveRecord::Migration
  def change
    change_table :cards do |t|
        t.references :superheroine, index: true
      end
  end
end
