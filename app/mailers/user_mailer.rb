class UserMailer < ApplicationMailer
  def torrent_notifier(user, movies)
    @user = user
    @movies = movies

    mail to: @user.email
  end
end
