class FixScanFileName < ActiveRecord::Migration
  def self.up
    magazine_folder = "zzap/"
  	
    ############
    # Number 51
    ############
    
    volume_id = 51
    
    99.times do |index|
      p = Page.find_by_volume_id_and_sequence(volume_id, index + 1)
      p.scan.path = magazine_folder + volume_id.to_s() + "/" + p.label.to_s.rjust(3, "0") + ".jpg"
      p.scan.save
    end
  end

  def self.down
  end
end
