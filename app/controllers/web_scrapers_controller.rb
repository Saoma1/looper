class WebScrapersController < ApplicationController

  def new
    WebScraper.crawl!
    redirect_to root_path, notice: 'Results stored in results.json file.'
  end

  def back
    WebScraper.crawl!
  end
end
