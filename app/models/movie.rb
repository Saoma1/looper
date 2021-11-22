class Movie < ApplicationRecord
  belongs_to :user
  has_one :movie_torrent
  validates :title, :uniqueness => {:scope=>:user_id}
end
