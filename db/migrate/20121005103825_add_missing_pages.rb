class AddMissingPages < ActiveRecord::Migration
  
  def self.up
  	magazine_folder = "zzap/"
  	
    ############
    # Number 29
    ############

    # Fix pages after Top Secret
    41.times do |index|
      update_label_and_path_by_volume_id_and_sequence(magazine_folder, 29, 56 + index, 40 + index, 40 + index)
    end

    # Fix Top Secret pages
    16.times do |index|
      update_label_and_path_by_volume_id_and_sequence(
        magazine_folder, 
        29,
        40 + index,
        roman_numeral(index + 1).to_s,
        '40_' + (index + 1).to_s.rjust(2, "0")
      )
    end

    # Fix sequence

    # every page of Top Secret move one position earlier
    16.times do |index|
      p = Page.find_by_volume_id_and_sequence(29, 40 + index)
      p.sequence = (p.sequence - 1)
      p.save
    end

    # page page 39 goes to 55
    p = Page.find_by_volume_id_and_sequence_and_label(29, 39, 39)
    p.sequence = 55
    p.save
  	
  	############
  	# Number 50
  	############
  	
  	# Move pages to make room for additional 4 pages
  	50.times do |index|
  	  update_sequence_by_volume_id_and_label(
  	    magazine_folder, 
  	    50,
  	    35 + index,
  	    35 + 4 + index
  	  )
  	end

  	# Move pages to make room for additional 4 pages
  	34.times do |index|
  	  update_sequence_by_volume_id_and_label(
  	    magazine_folder, 
  	    50,
  	    51 + index,
  	    55 + 4 + index
  	  )
  	end
  	
  	# Add 8 missing pages
  	4.times do |index|
      scan = Scan.new(:path => magazine_folder + '50/' + '34_' + roman_numeral(index + 1) + '.jpg')
      scan.save

      Page.new(
        :volume_id => 50,
        :label => roman_numeral(index + 1),
        :sequence => 35 + index,
        :scan_id => scan.id
      ).save
    end

    4.times do |index|
      scan = Scan.new(:path => magazine_folder + '50/' + '50_' + roman_numeral(index + 5) + '.jpg')
      scan.save

      Page.new(
        :volume_id => 50,
        :label => roman_numeral(index + 5),
        :sequence => 55 + index,
        :scan_id => scan.id
      ).save
    end
    
    # Fix volume page number
    volume = Volume.find(50)
    volume.pages_number = 92
    volume.save
  end

  def self.down
  end
  
  private
  def self.update_label_and_path_by_volume_id_and_sequence(magazine_folder, issue_number, sequence, new_label, new_filename)
  	p = Page.find_by_volume_id_and_sequence(issue_number, sequence)
  	p.label = (new_label).to_s
  	p.save
  	p.scan.path = magazine_folder + issue_number.to_s + "/" + new_filename.to_s + ".jpg"
  	p.scan.save
  end

  def self.update_sequence_by_volume_id_and_label(magazine_folder, issue_number, label, new_sequence)
  	p = Page.find_by_volume_id_and_label(issue_number, label)
  	p.sequence = (new_sequence).to_s
  	p.save
  end
    
  def self.roman_numeral(number)
    result, numerals = "", [
      [1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
      [100,  "C"], [90,  "XC"], [50,  "L"], [40,  "XL"],
      [10,   "X"], [9,   "IX"], [5,   "V"], [4,   "IV"],
      [1,    "I"]
    ]
    numerals.each do |order, roman|
      result << roman * (number / order)
      number %= order
    end
    result
  end
end
