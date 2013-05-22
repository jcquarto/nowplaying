class PagesController < ApplicationController
  def index
    @songs = Song.order("created_at DESC").limit(10)
  end

  def update_playlist
    path = "/Users/q/Music/djay/NowPlaying.txt"
    @data = File.read( path )

    @title =  @data.split("Title: ").last.split("Artist:").first.strip
    @artist = @data.split("Artist: ").last.split("Album:").first.strip

    @title = nil if @title = "N/A"
    @artist = nil if @artist = "N/A"

    last_song = Song.last
    if last_song.title.downcase = @title.downcase & last_song.artist.downcase = @artist.downcase
      return render :nothing => true
    else
      @song = Song.create!(title: @title, artist: @artist)
      render partial: "update_playlist"
    end
  end

end
