class Editor < ActiveRecord::Base
  has_many :issues
  
  attr_accessible :name
  
  def self.find_all_ordered
    timestamp = maximum(:updated_at)
    
    Rails.cache.fetch ['editors', timestamp.to_i].join('/') do
      find(:all, :order => "name")
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :name ])
  end
end
