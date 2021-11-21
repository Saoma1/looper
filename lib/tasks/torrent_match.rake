namespace :torrent_match do
  desc 'task description'
  task :execute => :environment do
    puts 'Soto, you are doing great'
    User.all.each do |currentUser|
      currentUser.movies.each do |movie|
        unless Torrent.find_by(title: movie.title).nil?
          puts "found match #{movie.title}"
        end
      end
    end
  end
end

# rake torrent_match:execute
