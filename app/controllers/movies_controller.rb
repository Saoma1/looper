class MoviesController < ApplicationController
  def index #Movie.all
    @user = current_user
    @movies = Movie.where(user_id: @user.id)
    @movie = Movie.new
  end

  def show
    redirect_to search_path
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to search_path, alert: "Added #{@movie.title} to your list"
    else
      redirect_to search_path, alert: "#{@movie.title} is already in your list"
    end
  end

  def destroy
    @user = current_user.id
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_back(fallback_location: search_path)
  end

  def destroy_all
    @user_id = current_user.id
    current_user.movies.destroy_all
    redirect_to home_path, alert: "All movies destroyed"
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :genre, :poster_url)
  end
end
