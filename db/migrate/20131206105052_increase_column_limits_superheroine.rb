class IncreaseColumnLimitsSuperheroine < ActiveRecord::Migration
  def change
    change_column :superheroines, :bio, :text, :limit => nil
  end
end
