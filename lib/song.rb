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

  def initialize(name=nil)
    @name = name
    @artist_name = nil
  end

  def self.new_by_name(name)
    new_song = Song.new(name)
  end

  def self.create_by_name(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by { |x,y| x.name }
  end

  def self.new_from_filename(file_name)
    each_word = file_name.split(" - ")
    artist_name = each_word[0]
    song_name = each_word[-1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    new_song = new_from_filename(file_name)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
