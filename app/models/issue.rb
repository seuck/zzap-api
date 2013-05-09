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
          	:volumes => [ :volume_type ]
        	},
          :magazine
        ],
        :order => "volumes.volume_type_id"
      )      
    end
  end
  
  def as_json(options={})
    super(:only => [ :id, :sequence, :year, :month ],
      :include => {
      	:editor => { :only => [ :id, :name ] },
        :magazine => { :only => [ :id, :name ] },
        :volumes => {
          :only => [ :id, :label, :pages_number, :volume_type_id => { :only => :name } ]
        }
      }
    )
  end
end
