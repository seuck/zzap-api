class Game < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :setting
  belongs_to :perspective
  has_and_belongs_to_many :genres
  has_many :game_versions
  
  attr_accessible :id, :name, :publisher_id, :setting_id, :perspective_id
  
  def self.find_all_complete
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ["games", timestamp.to_i].join('/') do
      find(
        :all,
        :include => [:publisher, :setting, :perspective, :genres],
        :order => "games.name, genres.name")
    end
  end
  
  def self.find_game(id)
    timestamp = find(id).updated_at
    Rails.cache.fetch ["game-#{id}", timestamp.to_i].join('/') do
      find(
        id,
        :include => [:publisher, :setting, :perspective, :genres],
        :order => "genres.name")
    end
  end

  
  def self.find_complete(id)
    timestamp = find(id).updated_at
    Rails.cache.fetch ["gamecomplete-#{id}" , timestamp.to_i].join('/') do
      find(
        id,
        :include => [:publisher,
                     :setting,
                     :perspective,
                     :genres,
                     { :game_versions => [{:system => :manufacturer },
                                          :media,
                                          :developer]
                     } ],
        :order => "genres.name, game_versions.year")
    end
  end

end
