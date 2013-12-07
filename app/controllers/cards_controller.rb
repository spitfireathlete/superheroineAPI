class CardsController < ApplicationController
  
  def index
    @cards = Card.all
  end
  
  def edit
    @card = Card.find(params[:id])
  end
  
  def update
    @card = Card.find(params[:id])
    puts "***********"
    logger.debug params[:card][:image]
    @card.assign_attributes(image: params[:card][:image])
    @card.save!
    
  end
  
end