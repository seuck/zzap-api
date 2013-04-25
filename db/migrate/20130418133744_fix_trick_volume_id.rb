class FixTrickVolumeId < ActiveRecord::Migration
  def up
    tricks = Trick.find(:all)
    tricks.each do |trick|
      case trick.volume_id
        when 1
        	trick.volume_id = 1
        when 2
        	trick.volume_id = 2
        when 3
        	trick.volume_id = 3
        when 4
        	trick.volume_id = 4
        when 5
        	trick.volume_id = 5
        when 6
        	trick.volume_id = 6
        when 7
        	trick.volume_id = 7
        when 8
        	trick.volume_id = 8
        when 9
        	trick.volume_id = 9
        when 10
        	trick.volume_id = 10
        when 11
        	trick.volume_id = 11
        when 12
        	trick.volume_id = 13
        when 13
        	trick.volume_id = 14
        when 14
        	trick.volume_id = 19
        when 15
        	trick.volume_id = 20
        when 16
        	trick.volume_id = 21
        when 17
        	trick.volume_id = 22
        when 18
        	trick.volume_id = 23
        when 19
        	trick.volume_id = 24
        when 20
        	trick.volume_id = 25
        when 21
        	trick.volume_id = 12
        when 22
        	trick.volume_id = 15
        when 23
        	trick.volume_id = 17
        when 24
        	trick.volume_id = 18
        when 25
        	trick.volume_id = 26
        when 26
        	trick.volume_id = 27
        when 27
        	trick.volume_id = 28
        when 28
        	trick.volume_id = 29
        when 29
        	trick.volume_id = 30
        when 30
        	trick.volume_id = 31
        when 31
        	trick.volume_id = 32
        when 32
        	trick.volume_id = 33
        when 33
        	trick.volume_id = 34
        when 34
        	trick.volume_id = 35
        when 35
        	trick.volume_id = 36
        when 36
        	trick.volume_id = 37
        when 37
        	trick.volume_id = 38
        when 38
        	trick.volume_id = 39
        when 39
        	trick.volume_id = 40
        when 40
        	trick.volume_id = 41
        when 41
        	trick.volume_id = 42
        when 42
        	trick.volume_id = 43
        when 43
        	trick.volume_id = 44
        when 44
        	trick.volume_id = 45
        when 45
        	trick.volume_id = 46
        when 46
        	trick.volume_id = 47
        when 47
        	trick.volume_id = 48
        when 48
        	trick.volume_id = 49
        when 49
        	trick.volume_id = 50
        when 50
        	trick.volume_id = 51
        when 51
        	trick.volume_id = 52
        when 52
        	trick.volume_id = 53
        when 53
        	trick.volume_id = 54
        when 54
        	trick.volume_id = 55
        when 55
        	trick.volume_id = 56
        when 56
        	trick.volume_id = 57
        when 57
        	trick.volume_id = 58
        when 58
        	trick.volume_id = 59
        when 59
        	trick.volume_id = 60
        when 60
        	trick.volume_id = 61
        when 61
        	trick.volume_id = 62
        when 62
        	trick.volume_id = 63
        when 63
        	trick.volume_id = 64
        when 64
        	trick.volume_id = 65
        when 65
        	trick.volume_id = 66
        when 66
        	trick.volume_id = 67
        when 67
        	trick.volume_id = 68
        when 68
        	trick.volume_id = 69
        when 69
        	trick.volume_id = 70
        when 70
        	trick.volume_id = 71
        when 71
        	trick.volume_id = 72
        when 72
        	trick.volume_id = 73
        when 73
        	trick.volume_id = 74
        when 74
        	trick.volume_id = 75
        when 75
        	trick.volume_id = 76
        when 76
        	trick.volume_id = 77
        when 77
        	trick.volume_id = 78
        when 78
        	trick.volume_id = 79
        when 79
        	trick.volume_id = 80
        when 80
        	trick.volume_id = 81
        when 81
        	trick.volume_id = 82
        when 82
        	trick.volume_id = 83
        when 83
        	trick.volume_id = 84
        when 84
        	trick.volume_id = 16
        else 0
      end
      trick.save
    end
  end


  def down
  end
end
