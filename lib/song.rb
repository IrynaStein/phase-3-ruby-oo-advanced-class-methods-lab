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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name.downcase <=> b.name.downcase}
  end

  def self.new_from_filename(song_file)
    data = song_file.split(" - ")
    name = data[1].split('.')[0]
    artist_name = data[0]
    

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_file)
    song = self.new_from_filename(song_file)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
