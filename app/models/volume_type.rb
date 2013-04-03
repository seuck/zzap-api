class VolumeType < ActiveRecord::Base
  has_many :volumes
  
  attr_accessible :name
end
