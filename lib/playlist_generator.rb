
require 'playlist_generator/'


class PlaylistGenerator

  def initialize(artist)
    @artist = artist
  end

  def generate_from_artist(artist)
    similar_artists = API::Echonest.new(API::ECHONEST_API_KEY).similar(artist)
  end

end
