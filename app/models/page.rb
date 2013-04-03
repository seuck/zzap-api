class Page < ActiveRecord::Base
  belongs_to :scan
  belongs_to :volume
  
  attr_accessible :volume_id, :label, :sequence, :scan_id
end
