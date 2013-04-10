class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :name, :null => false

      t.timestamps
    end
    
    Setting.create(:name => "Life")
    Setting.create(:name => "Space")
    Setting.create(:name => "Marine")
    Setting.create(:name => "Flight")
    Setting.create(:name => "Western")
    Setting.create(:name => "Pirates")
    Setting.create(:name => "War")
    Setting.create(:name => "Fantasy")
    Setting.create(:name => "Medieval")
    Setting.create(:name => "Comics")
    Setting.create(:name => "Horror")
    Setting.create(:name => "Spy Fiction")
    Setting.create(:name => "Science fiction")
    Setting.create(:name => "Police")
    Setting.create(:name => "Erotic")
    Setting.create(:name => "Mystery")
    Setting.create(:name => "Far East")
  end
  
  def self.down
    drop_table :settings
  end
end
