module API
  class EchoNest < Struct.new(:api_key)
    include HTTParty
    format :json

    # BASE_URL = 'http://developer.echonest.com/api/v4/artist/similar?'

    # BASE_URL = 'http://developer.echonest.com/api/v4/playlist/basic?api_key=FILDTEOIK2HBORODV&artist=Weezer&format=json&results=20&type=artist-radio'

    BASE_URL = 'http://developer.echonest.com/api/v4'

    # Example response
    # {
    #   "response": {
    #     "status": {
    #       "version": "4.2",
    #       "code": 0,
    #       "message": "Success"
    #     },
    #     "songs": [
    #       {
    #         "title": "Dreamin'",
    #         "artist_name": "Weezer",
    #         "artist_id": "AR633SY1187B9AC3B9",
    #         "id": "SOHBJKR1280EC909D4"
    #       },
    #       {
    #         "title": "This Is A Call'",
    #         "artist_name": "Foo Fighters",
    #         "artist_id": "AR6XPWV1187B9ADAEB",
    #         "id": "SOMPOYK1280ED5098B"
    #       },
    #       {
    #         "title": "Life in a glasshouse",
    #         "artist_name": "Radiohead",
    #         "artist_id": "ARH6W4X1187B99274F",
    #         "id": "SOAPCKQ127F3E1B7A8"
    #       }
    #     ]
    #   }
    # }


    DEFAULT_PARAMS = { format: 'json' }

    def similar(seed_artist)
      search({
        name: seed_artist,
        endpoint: 'artists/simliar'
      })
    end

    def playlist_from_artist(seed_artist)
      search({
        endpoint: 'playlist/basic',
        type: 'artist-radio',
        results: '20',
        artist: seed_artist
      })
    end

    def search(params)
      endpoint = params.delete(:endpoint)
      query_params = params.merge({api_key: api_key}).map { |k,v| [k,v].join('=')}.join('&')
      request_url = [BASE_URL, endpoint].join('/') + '?' + query_params

      HTTParty.get(request_url)
    end
  end
end
