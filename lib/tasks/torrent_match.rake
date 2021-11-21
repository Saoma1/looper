namespace :torrent_match do
  desc 'task description'
  task :execute => :environment do
    puts 'Soto, you are doing great'
    WebScraper.new.parse
  end
end
