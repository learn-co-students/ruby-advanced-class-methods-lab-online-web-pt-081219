class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.create 

    song = self.new 
    song.save 
    song
    
  end 
 
 
  def self.create_by_name(song_name)
    
    song = self.new 
    song.name = song_name
    song.save 
    song
    
  end
 
 
  def self.new_by_name(song_name)
    
    song = self.new 
    song.name = song_name
    song
    
  end 
  
  
  def self.find_by_name(song_name) 
    
    self.all.detect {|s| s.name == song_name}
    
  end
  
  def self.find_or_create_by_name(target_song)
  
    self.find_by_name(target_song) || self.create_by_name(target_song)
    
  end 


  def self.alphabetical
  
    self.all.sort_by { |x| x.name}
  
  end 
  
  
  def self.new_from_filename(song_file)
    
    song = self.new 
    song.name = song_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = song_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
    
  end 
  
  def self.create_from_filename(song_file)
    
    song = self.new 
    song.name = song_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = song_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song.save
    song
    
  end 
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
 
end