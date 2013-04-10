class CreatePerspectives < ActiveRecord::Migration
  def self.up
    create_table :perspectives do |t|
      t.string :name, :null => false

      t.timestamps
    end
    
    Perspective.create(:name => "2D Side scrolling")
    Perspective.create(:name => "2D Vertical scrolling")
    Perspective.create(:name => "2D Multi scrolling")
    Perspective.create(:name => "2D Fixed screen")
    Perspective.create(:name => "2D First person")
    Perspective.create(:name => "3D Third person")
    Perspective.create(:name => "3D Isometric scrolling")
    Perspective.create(:name => "3D Isometric fixed screen")
    Perspective.create(:name => "3D First person")
    Perspective.create(:name => "2D Third Person")
  end
  
  def self.down
    drop_table :perspectives
  end
end
