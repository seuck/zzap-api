class PopulatePages < ActiveRecord::Migration
  def self.up
    volumes = Volume.find(:all)
    volumes.each do |v|
      for p in 1..v.pages_number do
        s = Scan.create(:path => "zzap/" + v.id.to_s() + "/" + p.to_s.rjust(2, "0") + ".jpg")
        Page.create(:volume_id => v.id, :label => p, :sequence => p, :scan_id => s.id)
      end
    end
  end

  def self.down
    Scan.delete_all
    Page.delete_all
  end
end
