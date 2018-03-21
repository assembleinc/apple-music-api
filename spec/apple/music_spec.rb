require "spec_helper"
require "yaml"
require "pry"

RSpec.shared_examples 'it inherits from Apple::Music::Base' do |subclass, instance|
  # binding.pry
end

RSpec.shared_examples 'it has tracks' do |_|
end

RSpec.shared_examples 'it has artwork' do |_|
end

RSpec.describe Apple::Music do
  it "has a version number" do
    expect(Apple::Music::VERSION).not_to be nil
  end
end

RSpec.describe Apple::Music::Error do
  ### ...
end

RSpec.describe Apple::Music::Artist do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Artist

  # context "since the artist fixtures were last updated" do
  #   it "should have the same structure" do
  #     artist_raw = load_fixture("artists/#{@artist_ids.first}.yaml")
  #     found_artist = @client.artist @artist_ids.first

  #     binding.pry
  #   end
  # end
end

RSpec.describe Apple::Music::Album do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Album
  it_behaves_like 'chris_format', Apple::Music::Album

end

RSpec.describe Apple::Music::Activity do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Activity

end

RSpec.describe Apple::Music::Chart do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Chart

end

RSpec.describe Apple::Music::AppleCurator do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::AppleCurator

end

RSpec.describe Apple::Music::Genre do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Genre

end

RSpec.describe Apple::Music::Curator do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Curator

end

RSpec.describe Apple::Music::MusicVideo do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::MusicVideo

end

RSpec.describe Apple::Music::Playlist do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Playlist
  # it_behaves_like 'chris_format', Apple::Music::Playlist

  ### Can get a description from a playlist
  # @playlist.description

  ### Can get artwork from a playlist
  # @playlist.artwork

  ### Can get artwork url from playlist
  # @playlist.artwork.url

  ### Can get a playlist given an id
  # @apple_music_client.playlist(@id)

  ### Can get playlist attributes from a Playlist
  # @playlist.attributes

  ### Can get Tracks from a Playlist
  # @playlist.tracks

  ### Can get Track count from a Playlist
  # @playlist.tracks.count

  ### Iterating over Tracks also works
  # @playlist.tracks.each{ |track| ... }

  ### Can get Artwork from a Playlist
  # @playlist.attributes[:artwork]

  ### Can get a url from a playlist
  # @playlist.url

  ### Can get Url from Playlist's Attributes
  # @playlist.attributes[:url]

  ### Can get a curator_url from a playlist
  # @playlist.curator.url

end

RSpec.describe Apple::Music::Song do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Song
  # it_behaves_like 'chris_format', Apple::Music::Song

end

RSpec.describe Apple::Music::Station do

  # it_behaves_like 'it inherits from Apple::Music::Base', Apple::Music::Station

end

RSpec.describe Apple::Music::Storefront do
end
