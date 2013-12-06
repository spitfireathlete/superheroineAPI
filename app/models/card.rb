class Card < ActiveRecord::Base
  has_many :videos, :through => :heroine_videos, :source => :video
end
