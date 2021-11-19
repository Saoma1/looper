class WebScrapersController < ApplicationController

  def new
    # WebScraper.new.parse
    ScraperJob.perform_later

    flash[:notice] = 'Torrent Scraper launched in backround'
    redirect_to root_path
  end

  def scrape
    WebScraper.new.parse
  end
end
