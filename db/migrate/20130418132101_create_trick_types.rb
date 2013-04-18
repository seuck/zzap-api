class CreateTrickTypes < ActiveRecord::Migration
  def self.up
    create_table :trick_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
    
    TrickType.create(:id => 1, :name => 'Tip')
    TrickType.create(:id => 2, :name => 'Cheat')
    TrickType.create(:id => 3, :name => 'Map')
    TrickType.create(:id => 4, :name => 'Walkthrough')
    TrickType.create(:id => 5, :name => 'Poke')
    TrickType.create(:id => 6, :name => 'Listing')
  end
  
  def self.down
    drop_table :trick_types
  end
end
