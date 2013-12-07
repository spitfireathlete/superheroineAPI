class Card < ActiveRecord::Base
  has_many :heroine_videos
  belongs_to :superheroine
  mount_uploader :image, ImageUploader
end
