class Volume < ActiveRecord::Base
  belongs_to :issue
  belongs_to :volume_type
  has_many :pages
  has_and_belongs_to_many :scan_authors
  
  attr_accessible :issue_id, :volume_type_id, :label, :pages_number
end
