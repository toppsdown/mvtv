require 'api'
require 'pry'

# lastfm = Recommend::LastFM.new('ffaabe615ed795bfe0a02de9d0e0d683')

# output = lastfm.similar_by_artist('pinback')
# # puts output

# echonest = API::EchoNest.new('J5UMPOUTF1LFP1JIH')
# response = echonest.playlist_from_artist('pinback')
binding.pry

imvdb_api_key = 'YkSfkAE6iqCb2NCzhzKMtKYevSh2XtEWNwb77Qeq'
imvdb = API::Imvdb.new(imvdb_api_key)
response = imvdb.get_sources_from_artist('pinback')




