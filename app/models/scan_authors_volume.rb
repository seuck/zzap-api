class ScanAuthorsVolume < ActiveRecord::Base
  belongs_to :scan_author
  belongs_to :volumes
  
  attr_accessible :volume_id, :scan_author_id
end
