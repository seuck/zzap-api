class Advert < ActiveRecord::Base
  belongs_to :volume
  belongs_to :game
  belongs_to :page
  attr_accessible :volume_id, :game_id, :page_id
end
