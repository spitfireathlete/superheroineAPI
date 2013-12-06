module Api
class CardsController < ApiController
  def index
    @cards = Card.all
    respond_with @cards
  end
  
  def show
    @card = Card.find(params[:id])
    respond_with @card
  end
end
end