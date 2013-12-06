class Superheroine < ActiveRecord::Base
  has_many :superpowers, :through => :superheroine_powers, :source => :superpower
  has_many :superheroine_powers
end
