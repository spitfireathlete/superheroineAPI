class IncreaseColumnLimitsForQuotes < ActiveRecord::Migration
  def change
    change_column :cards, :quotes, :text, :limit => nil
  end
end
