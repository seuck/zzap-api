class System < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :versions
  attr_accessible :id, :name, :manufacturer_id
end
