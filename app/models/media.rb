class Media < ActiveRecord::Base
  has_many :versions
  attr_accessible :name, :path
end
