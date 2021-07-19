class MoviesController < ApplicationController

# def index
  
# end

def show
  @movie = Movie.find(params[:id])
  @actors = @movie.order_youngest_to_oldest
end

# def new
  
# end

# def create
  
# end

# def edit
  
# end

# def update
  
# end

# def destroy
  
# end

# private
#   def _params
#     params.permit(:)
#   end
end