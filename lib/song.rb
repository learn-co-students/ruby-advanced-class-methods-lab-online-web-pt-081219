require 'pry'

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
    new_song = Song.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    return_name = nil
    @@all.each do |instance|
      if instance.name == name
        return_name = instance
      end
    end
    return_name 
  end
  
  def self.find_or_create_by_name(name)
    
    if instance = self.find_by_name(name)
      instance
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    names = @@all.map{|instance| instance.name}
    all_sorted = names.sort.map{|name| self.find_by_name(name)}
  end
  
  def self.new_from_filename(filename)
    split_array = filename.split(" - ")
    split_array[1].slice!(".mp3")
    
    artist_name = split_array[0]
    song_name = split_array[1]
    
    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
