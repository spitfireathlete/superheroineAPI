class CreateHeroineVideos < ActiveRecord::Migration
  def change
    create_table :heroine_videos do |t|
      t.references :video_link
      t.references :card, index: true
      t.timestamps
    end
  end
end
