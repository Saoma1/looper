class ScrapeJob < ApplicationJob
  queue_as :default

  def perform()
    WebScraper.new.parse
  end
end

# ScrapeJob.perform_now
# ScrapeJob.perform_later
