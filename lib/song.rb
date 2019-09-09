class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create 
   song = self.new
   song.save
   song
  end
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save
    song
  end
  def self.find_by_name(song_name)
    @@all.find{|person| person.name == song_name}
  end
  def self.find_or_create_by_name(song_name)
  # song_1 = self.find_by_name(song_name)
  # song_2 = self.create_by_name(song_name)
  # song_1 == song_2
  # both_songs = self.all.find {|x| x.name == song_name}
  #   if both_songs == nil
  #     song = self.new 
  #     song.name = song_name
  #     song.save 
  #     song
  #   else
  #     both_songs
   # end
   self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end
  def self.new_from_filename(mp3_file)
    song = self.new
    song.name = mp3_file.split(" - ")[1].split(".")[0]
    song.artist_name = mp3_file.split(" - ")[0]
    song
  end
  def self.create_from_filename(mp3_file)
    song = self.new
    song.name = mp3_file.split(" - ")[1].split(".")[0]
    song.artist_name = mp3_file.split(" - ")[0]
    song.save
    #@@all << song
  end
 def self.destroy_all 
    @@all.clear
  end
   #  @@all = []
#  end
end
