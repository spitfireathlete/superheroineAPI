module Api
class SuperheroinesController < ApiController
  def index
    @superheroines = Superheroine.all
    respond_with @superheroines
  end
  
  def show
    @superheroine = Superheroine.find(params[:id])
    respond_with @superheroine
  end
end
end
