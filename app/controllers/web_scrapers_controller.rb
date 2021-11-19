class WebScrapersController < ApplicationController

  def new
    WebScraper.new.parse
    redirect_to root_path, notice: 'Torrent Scraper has finished'
  end

  def back
    WebScraper.new
  end
end
