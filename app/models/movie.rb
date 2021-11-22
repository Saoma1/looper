class Movie < ApplicationRecord
  belongs_to :user
  has_one :movie_torrent #, :dependent => :destroy
  validates :title, :uniqueness => {:scope=>:user_id}
end
