class Page < ActiveRecord::Base
  belongs_to :scan
  belongs_to :volume
  has_many :tricks
  
  attr_accessible :volume_id, :label, :sequence, :scan_id
end
