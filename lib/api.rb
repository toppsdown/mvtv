require 'httparty'
require 'services/logger'
require 'api/last_fm'
require 'api/echonest'
require 'api/imvdb'

module API
  ECHONEST_API_KEY = ENV['ECHONEST_API_KEY']
  IMVDB_API_KEY = ENV['IMVDB_API_KEY']
  LASTFM_API_KEY = ENV['LASTFM_API_KEY']
end
