class MoviesController < ApplicationController
  def index #Movie.all
    @movies = Movie.where(user_id: current_user.id)
    @movie = Movie.new
    # authorize @movie
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movies_path
    else
      redirect_to movies_path, alert: "#{@movie.title} is already in your list"
      #@movie.errors.full_messages
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_back(fallback_location: root_path)
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :genre, :poster_url)
  end
end
