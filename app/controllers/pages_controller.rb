class PagesController < ApplicationController

  def home
    @user = current_user
    @movies = @user.movies
    @movie_torrents = @user.movie_torrents.all
  end

  def search
    @user = current_user
    @movie = Movie.new
    @movies = @user.movies
  end

end
