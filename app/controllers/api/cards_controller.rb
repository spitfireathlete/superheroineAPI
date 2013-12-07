module Api

class CardsController < ApiController
  include CardsHelper
  def index
    @cards = Card.all
    @favs = current_user.favorite_cards.select(:card_id).map {|x| x.card_id}
    logger.debug "***********"
    puts @favs    
    respond_with @cards
  end
  
  def show
    @card = Card.find(params[:id])
    favs = FavoriteCard.where(:user_id => current_user.id, :card_id => @card.id)
    @isFav = !favs.empty?
    respond_with @card
  end
  
  def create
    cards = Card.where(name: card_params[:name])
    if cards.nil? or cards.empty? then
      @card = Card.new(name: card_params[:name], display_name: card_params[:display_name], title: card_params[:title], bio: card_params[:bio], facts: card_params[:facts], advice: card_params[:advice], goals: card_params[:goals], quotes: card_params[:quotes])
      
      superheroine = Superheroine.find_by_name(card_params[:superheroine_name])
      if superheroine.nil? then
        respond_error 'Could not find superheroine with name %s' % card_params[:superheroine_name]
        return
      end
      @card.superheroine_id = superheroine.id
      
      if @card.save!
        @video = HeroineVideo.where(:card_id => @card.id, :video_link => card_params[:video_link]).first_or_create
        respond_to do |format|
          format.json { render json: @card, status: :created }
        end
        return
        
      else
        respond_error @card.errors
        return
      end
      
    else
      respond_error("Card for %s already exists" % card_params[:name])
    end
          
  end
  
  def update
    cards = Card.where(name: card_params[:name])
    if cards.nil? or cards.empty? then
      respond_error("No card for %s exists" % card_params[:name])
      return
    end
    
    @card = cards[0]
    @card.assign_attributes(display_name: card_params[:display_name], title: card_params[:title], bio: card_params[:bio], facts: card_params[:facts], advice: card_params[:advice], goals: card_params[:goals], quotes: card_params[:quotes])
    
    
    superheroine = Superheroine.find_by_name(card_params[:superheroine_name])
    if superheroine.nil? then
      respond_error("Could not find superheroine with name %s" % card_params[:superheroine_name])
      return
    end
    
    @card.superheroine_id = superheroine.id
    
    if @card.save!
      HeroineVideo.where(:card_id => @card.id).destroy_all
      @video = HeroineVideo.where(:card_id => @card.id, :video_link => card_params[:video_link]).first_or_create
      respond_to do |format|
        format.json { render json: @card, status: :created }
      end
      
      else
        respond_error @card.errors
    end
     
  end
  
  def favorite
    @card = Card.find(params[:id])
        favs = FavoriteCard.where(:user_id => current_user.id, :card_id => @card.id)
        if not favs.empty? then
          return head :no_content
        end
        
        @fav = FavoriteCard.new(:user_id => current_user.id, :card_id => @card.id)
        @card.num_favorites = @card.num_favorites + 1
        
        if @fav.save! and @card.save
          respond_to do |format|
            format.json { render json: @card, status: :created }
          end
        else
          respond_to do |format|
            format.json { render json: @card.errors, status: :unprocessable_entity }
          end
        end
  end
  
  def share
    @card = Card.find(params[:id])
    
    @shared = SharedCard.new(:user_id => current_user.id, :card_id => @card.id, :platformType => TWITTER)
    @card.num_shares = @card.num_shares + 1
    
    if @shared.save! and @card.save
      respond_to do |format|
        format.json { render json: @card, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  private
  def card_params
          params.permit(:id, :name, :display_name, :title, :bio, :facts, :advice, :goals, :superheroine_name, :video_link, :quotes)
  end
  
  def respond_error (message)
    respond_to do |format|
      format.json { render json: message, status: :unprocessable_entity }
    end
  end
  
  
end
end