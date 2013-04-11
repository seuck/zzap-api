class Game < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :setting
  belongs_to :perspective
  has_and_belongs_to_many :genres
  
  attr_accessible :id, :name, :publisher_id, :setting_id, :perspective_id
  
  def self.find_all_complete
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['games', timestamp.to_i].join('/') do
      find(:all, :include => [:publisher, :setting, :perspective, :genres], :order => "games.name")
    end
  end
  
  def self.find_complete(id)
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['games-#{id}' , timestamp.to_i].join('/') do
      find(id, :include => [:publisher, :setting, :perspective, :genres])
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :name ],
      :include => {
          :publisher => { :only => [:id, :name] },
          :setting => { :only => [:name] },
          :perspective => { :only => [:name] },
          :genres => { :only => [:id, :name] }
      }
    )
  end
end
