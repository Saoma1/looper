class MovieTorrentsController < ApplicationController
  def index #Movie.all
    @user = current_user
    @movie_torrents = @user.movie_torrents.all
  end

  def create
    @movie_torrent = Movie_Torrent.new(movie_torrent_params)
    @movie_torrent.save
    #   redirect_to search_path, alert: "Added #{@movie.title} to your list"
    # else
    #   redirect_to search_path, alert: "#{@movie.title} is already in your list"
    # end
  end

  def movie_torrent_params
    params.require(:movie_torrent).permit(:title, :url, :clicked, :release_date, :genre, :poster_url)
  end
end
