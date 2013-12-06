class Card < ActiveRecord::Base
  has_many :heroine_videos
  belongs_to :superheroine
end
