module Api
class CardsController < ApiController
  def index
    @cards = Card.all
  end
end
end