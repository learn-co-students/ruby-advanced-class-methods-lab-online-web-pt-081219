require "pry"
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
    @@all << song
    song   
  end 
  
  def self.new_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name
    new_song
  end 
  
  def self.create_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name 
    @@all << new_song 
    new_song
  end 
  
  def self.find_by_name(song_name) 
    @@all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    @@all.sort_by {|word| word.name}
  end
  
  def self.new_from_filename(file_name)
    song = self.new
    file = file_name.split(" - ")
    song.name = file[1].split(".")[0]
    song.artist_name = file[0]
    song 
  end 
  
  def self.create_from_filename(file_name)
    song = self.new
    file = file_name.split(" - ")
    song.name = file[1].split(".")[0]
    song.artist_name = file[0]
    @@all << song  
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
end

