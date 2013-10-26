class PagesController < ApplicationController

  def index
  end

  def now_playing
    path = "/Users/q/Music/djay/NowPlaying.txt"
    data = File.read( path )

    @title =  data.split("Title: ").last.split("Artist:").first.strip
    @artist = data.split("Artist: ").last.split("Album:").first.strip

    @title = nil if @title == "N/A"
    @artist = nil if @artist == "N/A"

    @last_song = Song.order("created_at DESC").limit(1).first
    if ( @last_song.nil? || ( @last_song.title != @title && @last_song.artist != @artist && @title != @artist) )
      song = Song.create!(title: @title, artist: @artist)
    end
    @songs = Song.order("created_at DESC").limit(6)

  end

  def announcement
    # this is in root of the app
    path = "announcement.txt"
    data = File.read( path )

    @heading =  data.split("Heading: ").last.split("Body:").first.strip
    @body = data.split("Body: ").last.strip

    @last_announcement = Announcement.order("created_at DESC").limit(1).first
    if ( @last_announcement.nil? || ( @last_announcement.heading != @heading && @last_announcement.body != @body) )
      announcement = Announcement.create!(heading: @heading, body: @body)
    end

    @announcement = Announcement.order("created_at DESC").limit(1).first
  end

  def test
    path = "/Users/q/Music/djay/NowPlaying.txt"
    data = File.read( path )

    @title =  data.split("Title: ").last.split("Artist:").first.strip
    @artist = data.split("Artist: ").last.split("Album:").first.strip
  end


end
