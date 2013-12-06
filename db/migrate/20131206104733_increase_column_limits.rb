class IncreaseColumnLimits < ActiveRecord::Migration
  def change    

    change_column :cards, :bio, :text, :limit => nil
    change_column :superpowers, :description, :text, :limit => nil
  end
end
