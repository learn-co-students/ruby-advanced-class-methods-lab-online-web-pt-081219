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
    song = Song.new
    @@all << song
    song
    
  end 
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = Song.new 
    song.name = name
    @@all << song
    song
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if name == song.name 
        return song 
       end
      end 
      nil
  end 
    

  def self.find_or_create_by_name(name)
       if Song.find_by_name(name)
         return Song.find_by_name(name)
       else
        return Song.create_by_name(name)
       end 
       
  end 
  
   def self.alphabetical
     @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(name)
    
   song_Info =  name.split(' - ')
  
   song_Info[1]=song_Info[1].split('.')
   
   song_name = create_by_name(song_Info[1][0])  
   
   song_name.artist_name = song_Info[0]
   
   song_name
    
  end 
  
  def self.create_from_filename(name)
    song_name = new_from_filename(name)
    @@all << song_name
  end 
  
  def self.destroy_all
    @@all.clear
  end

end
