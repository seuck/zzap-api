class TrickType < ActiveRecord::Base
  has_many :tricks
  attr_accessible :name
end
