class Publisher < ActiveRecord::Base
  belongs_to :country
  
  attr_accessible :name, :country_id

  def self.find_all_with_countries
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['publishers', timestamp.to_i].join('/') do
      find(:all, :include => :country, :order => "publishers.name")
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
