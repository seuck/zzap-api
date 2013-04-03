class ScanAuthor < ActiveRecord::Base
  has_many :scans
  has_and_belongs_to_many :volumes

  attr_accessible :name
end
