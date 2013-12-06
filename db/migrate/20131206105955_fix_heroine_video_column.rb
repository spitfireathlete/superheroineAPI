class FixHeroineVideoColumn < ActiveRecord::Migration
  def change
    remove_column :heroine_videos, :video_link_id
    add_column :heroine_videos, :video_link, :string
  end
end
