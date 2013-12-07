class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
         
  has_many :favorited, :through => :favorite_cards, :source => :card
  has_many :shared, :through => :shared_cards, :source => :card
  
  has_many :favorite_cards
  has_many :shared_cards
  
  before_save :ensure_authentication_token
  
end
