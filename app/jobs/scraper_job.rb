class ScraperJob < ApplicationJob
  queue_as :default

  def perform()
    WebScraper.new.parse
  end
end
