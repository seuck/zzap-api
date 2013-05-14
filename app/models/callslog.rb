class Callslog < ActiveRecord::Base
  attr_accessible :url, :ip, :method, :query, :response_code, :date, :page_duration, :view_duration, :db_duration
end
