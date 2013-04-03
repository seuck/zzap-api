class Magazine < ActiveRecord::Base
  has_many :issues
  
  attr_accessible :name
    
  def self.find_all_with_issues
    timestamp = maximum(:updated_at)
    Rails.cache.fetch ['magazines', timestamp.to_i].join('/') do
      find(:all, :include => :issues, :order => "magazines.name, issues.sequence")
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :name ],
      :include => {
          :issues => { :only => [ :id, :sequence, :year, :month ]#,
          #  :include => {
          #  :editor => { :only => [ :id, :name ] }
          #}
        }
      }
    )
  end
end
