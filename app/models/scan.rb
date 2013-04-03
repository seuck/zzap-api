class Scan < ActiveRecord::Base
  has_one :page
  
  attr_accessible :path
end
