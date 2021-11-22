class MatchTorrentsJob < ApplicationJob
  queue_as :default

  def perform()
    User.all.each do |user|
      user.movies.where(found: false).each do |movie|
        unless Torrent.find_by(title: movie.title).nil?
          puts "found match #{movie.title}"
          MovieTorrent.create(
            title: movie.title,
            url: Torrent.find_by(title: movie.title).url,
            genre: movie.genre,
            release_date: movie.release_date,
            poster_url: movie.poster_url,
            movie_id: movie.id)
          movie.found = true
        end
      end
    end
  end
end

# MatchTorrentsJob.perform_now
# MatchTorrentsJob.perform_later
