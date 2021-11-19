class WebScrapersController < ApplicationController

  def new
    WebScraper.new.parse
    redirect_to root_path, notice: 'Results stored in results.json file.'
  end

  def back
    WebScraper.new
  end
end
