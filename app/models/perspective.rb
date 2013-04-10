class Perspective < ActiveRecord::Base
  has_many :games
  
  attr_accessible :name
end
