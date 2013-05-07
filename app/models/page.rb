class Page < ActiveRecord::Base
  belongs_to :scan
  belongs_to :volume
  has_many :tricks
  has_many :adverts
  has_many :reviews

  attr_accessible :volume_id, :label, :sequence, :scan_id
end
