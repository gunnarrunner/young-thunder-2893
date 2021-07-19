class RolesController < ApplicationController
  # def index
    
  # end

  # def show
    
  # end
  
  # def new
    
  # end
  
  # def create
  #   movie = Movie.find(params[:id])
  #   actor = movie.actors.create(players_params)
  #   redirect_to "/movies/#{movie.id}"
  # end
  
  # def edit
    
  # end
  
  # def update
    
  # end
  
  # def destroy
    
  # end

private
  def roles_params
    params.permit(:name, :age)
  end
end