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
    song = Song.new
    song.save
    song
  end
 
  def Song.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end 
  
  def Song.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
    
  end  
  
  def Song.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end
  
  def Song.find_or_create_by_name(song_name)
    #if self.find_by_name(song_name)
     # song_name
    #else self.create_by_name(song_name)
    #end
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def Song.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def Song.new_from_filename(file_name)
    parts = file_name.split(' - ')
    artist_name = parts[0]
    song_name = parts[1].delete_suffix!(".mp3")
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
    
    
  end
  
  def Song.create_from_filename(file_name)
    parts = file_name.split(' - ')
    artist_name = parts[0]
    song_name = parts[1].delete_suffix!(".mp3")
    song = Song.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def Song.destroy_all
  @@all.clear
  end

end

  
  

