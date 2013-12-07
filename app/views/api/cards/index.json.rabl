collection @cards, :object_root => false
extends "api/cards/show"

node(:isFav) { |card| @favs.include?(card.id) }