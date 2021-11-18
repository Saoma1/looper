class Movie < ApplicationRecord
   validates :title, :uniqueness => {:scope=>:user_id}
end
