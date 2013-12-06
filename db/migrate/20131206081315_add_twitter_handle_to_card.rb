class AddTwitterHandleToCard < ActiveRecord::Migration
  def change
    change_table :cards do |t|
        t.string :twitter_handle
      end
  end
end
