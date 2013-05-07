class Review < ActiveRecord::Base
  belongs_to :game_version
  belongs_to :volume
  belongs_to :page
  
  attr_accessible :vote, :page_id, :game_version_id, :volume_id
end
