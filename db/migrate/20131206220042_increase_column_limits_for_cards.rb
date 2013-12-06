class IncreaseColumnLimitsForCards < ActiveRecord::Migration
  def change
    change_column :cards, :advice, :text, :limit => nil
    change_column :cards, :facts, :text, :limit => nil
    change_column :cards, :goals, :text, :limit => nil
  end
end
