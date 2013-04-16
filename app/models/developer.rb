class Developer < ActiveRecord::Base
  belongs_to :country
  has_many :versions
  
  attr_accessible :id, :name, :country_id
  
  def self.find_all_with_countries
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['developers', timestamp.to_i].join('/') do
      find(:all, :include => :country, :order => "developers.name")
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :name ],
      :include => {
          :country => { :only => [ :id, :name ] }
      }
    )
  end
end
