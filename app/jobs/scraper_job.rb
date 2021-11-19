class ScraperJob < ApplicationJob
  queue_as :default

  def perform()
    # WebScraper.new.parse

    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end
