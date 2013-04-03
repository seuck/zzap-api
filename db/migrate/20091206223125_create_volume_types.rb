class CreateVolumeTypes < ActiveRecord::Migration
  def self.up
    create_table :volume_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
    VolumeType.create(:name => "Main publication")
  end

  def self.down
    drop_table :volume_types
  end
end
