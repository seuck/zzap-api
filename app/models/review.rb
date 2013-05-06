class Review < ActiveRecord::Base
  belongs_to :version
  belongs_to :volume
  belongs_to :page
  attr_accessible :page, :vote
end
