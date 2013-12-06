module Api
class DecksController < ApiController
  def index
    @decks = Deck.all
    respond_with @decks
  end
  
  def show
    @deck = Deck.find(params[:id])
    respond_with @deck
  end
end
end
