class CreateMagazines < ActiveRecord::Migration
  def self.up
    create_table :magazines do |t|
    t.string :name, :null => false

    t.timestamps
  end
  Magazine.create(:name => "Zzap!")

  end

  def self.down
    drop_table :magazines
  end
end
