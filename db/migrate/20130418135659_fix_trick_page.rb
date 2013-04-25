class FixTrickPage < ActiveRecord::Migration
  def up
    add_column :tricks, :page_id, :integer
    add_index :tricks, :page_id
    
    tricks = Trick.find(:all)
    tricks.each do |trick|
      page = Page.where(volume_id: trick.volume_id, sequence: trick.page).first
      trick.page_id = page.id
      trick.save
    end
  end

  def down
    remove_index :tricks, :page_id
    remove_column :tricks, :page_id
  end
end
