namespace :torrent_match do
  desc 'task description'
  task :execute => :environment do
    puts 'Soto, you are doing great'
    User.all.each do |currentUser|
      currentUser.movies.where(found: false).each do |movie|
        unless Torrent.find_by(title: movie.title).nil?
          puts "found match #{movie.title}"
          Movie_Torrent.create(
            title: movie.title,
            url: Torrent.find_by(title: movie.title).url,
            genre: movie.genre,
            release_date: movie.release_date,
            poster_url: movie.poster_url)
          movie.found = true
        end
      end
    end
  end
end

# rake torrent_match:execute
