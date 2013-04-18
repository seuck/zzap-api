class GameVersion < ActiveRecord::Base
  belongs_to :game
  belongs_to :system
  belongs_to :media
  belongs_to :developer
  has_many :tricks
  attr_accessible :id, :year, :game_id, :system_id, :media_id, :developer_id
end
