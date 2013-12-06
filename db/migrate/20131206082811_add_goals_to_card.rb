class AddGoalsToCard < ActiveRecord::Migration
  def change
    change_table :cards do |t|
        t.string :goals
      end
  end
end
