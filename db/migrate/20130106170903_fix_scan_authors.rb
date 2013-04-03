class FixScanAuthors < ActiveRecord::Migration
  def self.up
    author = ScanAuthor.find_by_name('Paolo Formighieri')
    author.name = 'Paolo-Formighieri'
    author.save
  end

  def self.down
    author = ScanAuthor.find_by_name('Paolo-Formighieri')
    author.name = 'Paolo Formighieri'
    author.save
  end
end
