collection @cards, :object_root => false
extends "api/cards/show"

node(:image) {|card| card.image.url} 
node(:isFav) { |card| @favs.include?(card.id) }