class GamesGenre < ActiveRecord::Base
  belongs_to :game
  belongs_to :genre
  
  attr_accessible :game_id, :genre_id
end
