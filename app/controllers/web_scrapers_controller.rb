class WebScrapersController < ApplicationController

  def new
    ScraperJob.perform_later

    # WebScraper.new.parse
    redirect_to root_path
    flash[:notice] = 'Torrent Scraper launched in backround'
  end

  def back
    WebScraper.new
  end
end
