class System < ActiveRecord::Base
  belongs_to :manufacturer
  attr_accessible :id, :name, :manufacturer_id
end
