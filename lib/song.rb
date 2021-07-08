require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new 
    @@all << song
    song
  end

  def save
    self.class.all << self
  end
  

  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name} 
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      self.find_by_name(name) 
    else 
      self.create_by_name(name)
    end 
  end
      
  def self.alphabetical 
   # binding.pry
    @@all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(song)
    full_song = song.split(" - ") 
    artist = full_song[0] 
    song_title = full_song[1].chomp(".mp3") 
    song = self.new
    song.name = song_title 
    song.artist_name = artist 
    @@all << song 
    song
  end
  
  def self.create_from_filename(song)
        full_song = song.split(" - ") 
    artist = full_song[0] 
    song_title = full_song[1].chomp(".mp3") 
    song = self.new
    song.name = song_title 
    song.artist_name = artist 
    @@all << song 
    song
  end
  
  def self.destroy_all
    self.all.clear
    
  end
  
    
    
  
end