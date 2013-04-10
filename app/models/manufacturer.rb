class Manufacturer < ActiveRecord::Base
  belongs_to :country
  has_many :systems
  
  attr_accessible :id, :name, :country_id
  
  def self.find_all_with_countries
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['manufacturers', timestamp.to_i].join('/') do
      find(:all, :include => [:country, :systems], :order => "manufacturers.name")
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :name ],
      :include => {
          :country => { :only => [:id, :name] },
          :systems => { :only => [:name] }
      }
    )
  end
end
