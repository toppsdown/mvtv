module Recommend
  class LastFM < Struct.new(:api_key)
    # ?method=artist.getSimilar&api_key=xxx...

    include HTTParty
    format :json

    BASE_URL = 'http://ws.audioscrobbler.com/2.0/?format=json&'

    def similar_by_artist(seed_artist)
      search({
        method: 'artist.getSimilar',
        artist: seed_artist
      })
    end

    def similar_by_track(seed_track, seed_artist)
      response = search({
        method: 'track.getSimilar',
        track: 'seed_track',
        artist: 'seed_artist'
      })

      response
    end

    def search(params)
      query_params = params.merge({api_key: api_key}).map { |k, v| [k,v].join('=')}.join('&')
      url = BASE_URL + query_params

      puts "Trying URL: #{url}"

      HTTParty.get url
    end
  end
end
