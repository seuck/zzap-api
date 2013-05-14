class CreateCallslogs < ActiveRecord::Migration
  def self.up
    create_table :callslogs, :id => false do |t|
      t.string :method
      t.string :url
      t.string :ip
      t.integer :response_code
      t.float :page_duration
      t.float :view_duration
      t.float :db_duration
      t.datetime :date
    end
  end
  
  def self.down
    drop_table :callslogs
  end
end
