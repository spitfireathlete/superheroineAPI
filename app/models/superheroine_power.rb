class SuperheroinePower < ActiveRecord::Base
  belongs_to :superheroine
  belongs_to :superpower
end
