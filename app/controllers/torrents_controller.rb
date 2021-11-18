class TorrentsController < ApplicationController
  def index
    @torrents = Torrent.all
  end

  def create
    @torrent = Torrent.new(torrent_params)
    if @torrent.save!
      puts 'saved'
    else
      raise 'some error'
    end
  end

  def torrent_params
    params.require(:torrent).permit(:title, :release_year, :url)
  end
end
