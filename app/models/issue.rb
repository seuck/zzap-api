class Issue < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :editor
  has_many :volumes
  
  attr_accessible :magazine_id, :editor_id, :sequence, :month, :year
  
  def self.find_for_api(params)
    timestamp = find(params[:id]).updated_at
    Rails.cache.fetch ['issue', params[:id], timestamp.to_i].join('/') do
      find(:first,
        :conditions => { :id => params[:id] },
        :include => [
        	:editor, {
          	:volumes => [{:pages => :scan}, :scan_authors]
        	}],
        :order => "volumes.volume_type_id,pages.sequence,scan_authors.name"
      )      
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :sequence, :year, :month, :magazine_id ],
      :include => {
      	:editor => { :only => [ :id, :name ] },
        :volumes => { :only => [ :id, :volume_type_id, :label, :pages_number ],
          :include => {
            :pages => { :only => [ :id, :label, :sequence ],
              :include => { :scan => { :only => :path } }
            },
            :scan_authors => { :only => [:id, :name]}
          }
	      }
      }
    )
  end
end
