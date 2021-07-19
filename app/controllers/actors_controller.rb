class ActorsController < ApplicationController
  # def index
    
  # end

  # def show
    
  # end

  # def new
    
  # end

  def create
    # require "pry"; binding.pry
    movie = Movie.find(params[:movie_id])
    actor = movie.actors.create(actors_params)
    redirect_to "/movies/#{movie.id}"
  end

  # def edit
    
  # end

  # def update
    
  # end

  # def destroy
    
  # end

# private
  def actors_params
    params.permit(:name, :age)
  end
end