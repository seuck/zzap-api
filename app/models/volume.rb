class Volume < ActiveRecord::Base
  belongs_to :issue
  belongs_to :volume_type
  has_many :pages
  has_many :tricks
  has_many :adverts
  has_many :reviews
  has_and_belongs_to_many :scan_authors
  
  attr_accessible :issue_id, :volume_type_id, :label, :pages_number
  
  #
  # TODO Eager loading is not working for game's reviews
  #
  def self.find_for_api(params)
    timestamp = find(params[:id]).updated_at
    Rails.cache.fetch ['volume', params[:id], timestamp.to_i].join('/') do
      find(:first,
        :conditions => { :id => params[:id] },
        :include => [
          :volume_type,
          :scan_authors,
          [
            :pages => [
              :scan,
              [ :tricks =>
                [
                  :trick_type,
                  [ :game_version =>
                    [
                      :game,
                      :media,
                      [ :system => :manufacturer ]
                    ]
                  ]
                ]
              ],
              [ :adverts => :game ],
              [ :reviews =>
                [ :game_version =>
                  [
                    :game,
                    :media,
                    [ :system => :manufacturer ]
                  ]
                ]
              ]
            ]
          ]
        ],
        :order => "pages.sequence, scan_authors.name, games.name, game_versions.system_id, game_versions.media_id"
      )      
    end
  end
  
  def as_json(options={})
    super(
      :only => [ :id, :label, :pages_number ],
      :include => {
        :volume_type => { :only => :name },
        :scan_authors => { :only => [:id, :name]},
        :pages => { :only => [ :id, :label, :sequence ],
          :include => {
            :scan => { :only => :path },
            :tricks => { :only => {}, 
              :include => {
                :trick_type => { :only => :name },
                :game_version => { :only => [ :id ],
                  :include => {
                    :game => { :only => [ :id, :name ] },
                    :media => { :only => :name },
                    :system => {
                      :only => :name,
                      :include => {
                        :manufacturer => { :only => [ :id, :name ] }
                      }
                    }
                  }
                }
              }
            },
            :adverts => { :only => [ :id ],
              :include => {
                :game => { :only => [ :id, :name ] }
              }
            },
            :reviews => { :only => [ :vote ],
              :include => {
                :game_version => { :only => [ :id ],
                  :include => {
                    :game => { :only => [ :id, :name ] },
                    :media => { :only => :name },
                    :system => {
                      :only => :name,
                      :include => {
                        :manufacturer => { :only => [ :id, :name ] }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    )
  end
end
