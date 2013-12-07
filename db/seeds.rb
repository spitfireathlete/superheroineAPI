# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Superheroine.delete_all
Superpower.delete_all
Card.delete_all
Deck.delete_all

#############################################################################################

puts 'Creating Decks'

Deck.where(
  name: 'Women in Tech',  
  description: 'Heroines making an impact in the technology industry.' 
  ).first_or_create
  
Deck.where(
    name: 'Human Rights Activists',  
    description: 'Heroines fighting for human rights' 
  ).first_or_create
    
Deck.where(
      name: 'CEOs and Executives',  
      description: 'Heroines leading companies and boardrooms' 
    ).first_or_create
    
#############################################################################################
    
puts 'Creating Superpowers'

Superpower.where(
  name: 'Super Strength',  
  description: 'Users have incredible ability to defy weight limitations of the member of their race, but not completely break them. Dense, lengthy, or overweight items are easy to move and simple to use in nearly any manner. Users can crush, lift, throw, or catch items of great weight.' 
  ).first_or_create
  
Superpower.where(
    name: 'Flight',  
    description: 'Power to fly or otherwise move through the air using varying methods. Some possibilities include using one or more forms of energy, wings or similar structures, or even mimicking or becoming an animal that can fly.'
  ).first_or_create
    
Superpower.where(
      name: 'Enhanced Senses',  
      description: 'The user has extremely accurate senses, allowing them to see, hear, smell, taste, and/or feel more than an average member of their species.'
    ).first_or_create

#############################################################################################

puts 'Creating Superheroines'

File.open(File.join(Rails.root, 'db', 'superheroines.txt'), mode = "r") do |superheroines|
    superheroines.read.each_line do |superheroine|
      name, display_name, bio, image = superheroine.chomp.split("|")
      Superheroine.where(:name => name, :display_name => display_name, :bio => bio, :image => image).first_or_create
    end
  end
  
#############################################################################################
  
puts 'Linking Superheroines to Superpowers'

File.open(File.join(Rails.root, 'db', 'powers.txt'), mode = "r") do |powers|
  powers.read.each_line do |power|
    superheroine_name, superpower_name = power.chomp.split("|")
    superheroine = Superheroine.find_by_name(superheroine_name)
    superpower = Superpower.find_by_name(superpower_name)
    
    SuperheroinePower.where(:superheroine_id => superheroine.id, :superpower_id => superpower.id).first_or_create
  end
  
#############################################################################################

puts 'Creating Cards'
File.open(File.join(Rails.root, 'db', 'cards.txt'), mode = "r") do |cards|
    i = 0
    cards.read.each_line do |card|
      i  = i + 1
      if card.start_with?("#") then next end
      puts i
        
      name, display_name, title, bio, facts, advice, goals, alter_ego_name = card.chomp.split("|")
    
      superheroine = Superheroine.find_by_name(alter_ego_name)
      Card.where(:name => name, :display_name => display_name, :title => title, :bio => bio, :facts => facts, :advice => advice, :goals => goals, :superheroine_id => superheroine.id, ).first_or_create
    end
end

end
