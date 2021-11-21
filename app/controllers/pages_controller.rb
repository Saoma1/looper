class PagesController < ApplicationController

  def home
    @user = current_user
    @movies = Movie.where(user_id: current_user.id)
    @torrents = Torrent.all
  end

  def search
    @user = current_user
    @movie = Movie.new
    @movies = Movie.where(user_id: current_user.id)
    @torrents = Torrent.all
  end

end
