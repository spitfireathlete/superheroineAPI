class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
         
  has_many :favorite_cards, :through => :favorite_cards, :source => :card
  has_many :shared_cards, :through => :shared_cards, :source => :card
  
  before_save :ensure_authentication_token
  
end
