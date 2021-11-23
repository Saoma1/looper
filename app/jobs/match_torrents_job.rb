class MatchTorrentsJob < ApplicationJob
  queue_as :default

  def perform()
    User.all.each do |user|
      movies = []
      user.movies.where(found: false).each do |movie|
        unless Torrent.find_by(title: movie.title).nil?
          puts "found match #{movie.title}"
          url = Torrent.find_by(title: movie.title).url
          MovieTorrent.create(
            title: movie.title,
            url: url,
            genre: movie.genre,
            release_date: movie.release_date,
            poster_url: movie.poster_url,
            movie_id: movie.id)
          movie.found = true
          movie.save!
          movies << {title: movie.title, url: url}
        end
      end
      UserMailer.torrent_notifier(user, movies).deliver_now
    end
  end
end

# MatchTorrentsJob.perform_now
# MatchTorrentsJob.perform_later
