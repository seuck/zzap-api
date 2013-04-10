class Game < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :setting
  belongs_to :perspective
  
  attr_accessible :id, :name, :publisher_id, :setting_id, :perspective_id
  
  def self.find_all_complete
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['games', timestamp.to_i].join('/') do
      find(:all, :include => [:publisher, :setting, :perspective], :order => "games.name")
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :name ],
      :include => {
          :publisher => { :only => [:id, :name] },
          :setting => { :only => [:name] },
          :perspective => { :only => [:name]}
      }
    )
  end
end
