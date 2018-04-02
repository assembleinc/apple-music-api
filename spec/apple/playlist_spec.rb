require 'spec_helper'

RSpec.describe Apple::Music::Playlist do
  let(:client) { configured_client! }
  let(:object) do
    Apple::Music::Playlist.new(load_fixture('playlist').to_h[:data].first,
                               {}, client)
  end

  it_behaves_like 'formattable', %i[ name url description description_short
                                     artwork_url tracks curator_name
                                     curator_url ]

  it_behaves_like 'it inherits from Apple::Music::Base'
  it_behaves_like 'it has artwork'
  it_behaves_like 'it has tracks'

  ### Can get a description from a playlist
  # @playlist.description

  ### Can get a playlist given an id
  # @apple_music_client.playlist(@id)

  ### Can get playlist attributes from a Playlist
  # @playlist.attributes

  ### Can get Artwork from a Playlist
  # @playlist.attributes[:artwork]

  ### Can get a url from a playlist
  # @playlist.url

  ### Can get Url from Playlist's Attributes
  # @playlist.attributes[:url]

  ### Can get a curator_url from a playlist
  # @playlist.curator.url
end
