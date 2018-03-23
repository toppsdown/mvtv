require 'uri'

module API
  class Imvdb
    include HTTParty
    debug_output $stdout
    binding.pry
    include CustomLogger

    BASE_URL = 'http://imvdb.com/api/v1/'

    def initialize(api_key)
      @api_key = api_key
    end

    def get_sources_from_id(video_ids)
      responses = video_ids.map do |id|
        search({ endpoint: "video/#{id}", 'include' => 'sources' })
      end
    end

    def get_sources_from_artist(artist)
      response = search_videos_by_artist(artist)

      video_ids = response["results"].map { |r| r['id'] }
      log("Found IDs #{video_ids}")

      sourcelists = get_sources_from_id(video_ids).map { |r| r['sources'] }

      sourcelists.map do |sls|
        source_info = sls.first

        case source_info["source"]
        when 'youtube'
          youtube_url(source_info['source_data'])
        when 'vimeo'
          vimeo_url(source_info['source_data'])
        end
      end
    end

    def search_videos_by_artist(artist)
      log("Searching songs by #{artist}")
      search({ endpoint: 'search/videos', q: artist })
    end

    def search(params)
      log("Querying IMVDB")
      headers = { 'IMVDB-APP-KEY' => @api_key }
      url = BASE_URL + params.delete(:endpoint)

      HTTParty.get(url, query: params, headers: headers)
    end

    def youtube_url(id)
      "https://www.youtube.com/watch?v=#{id}"
    end

    def vimeo_url(id)
      "https://vimeo.com/#{id}"
    end
  end
end
