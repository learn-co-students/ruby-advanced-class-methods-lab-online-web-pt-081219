# require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end
  
  def self.create
    song = self.new
    self.all << song
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
    song.save #why does this not work? without below code? isn't this saving the instantiated song to the @@all array??
    #song (continued from above that did not work)
    # all.find{|s|s.name == song_name}
  end 
  
  def self.find_by_name(song_name)
    all.find{|s|s.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    if all.include?(find_by_name(song_name)) #if @@all array includes the instance of the object who has the song name 
      find_by_name(song_name) #return that instance
    else 
      create_by_name(song_name) #otherwise create one
    end 
  end 
  
  def self.alphabetical
    all.sort_by{|song|song.name}
  end 
  
  def self.new_from_filename(filename)

    song_info = filename.split(" - ")
    song_info[1].slice!(".mp3")
    
    song = create_by_name(song_info[1])
    song.name = song_info[1]
    song.artist_name = song_info[0]
    
    song 
  end 
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end 
  
  def self.destroy_all
    all.clear
  end 
end
