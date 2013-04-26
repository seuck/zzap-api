class Trick < ActiveRecord::Base
  belongs_to :game_version
  belongs_to :trick_type
  belongs_to :volume
  belongs_to :page
  attr_accessible :page, :game_version_id, :trick_type_id, :volume_id, :page_id
end
