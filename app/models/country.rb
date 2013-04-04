class Country < ActiveRecord::Base
  has_many :developers
  has_many :publishers
  has_many :manufacturers
  
  attr_accessible :name
end
