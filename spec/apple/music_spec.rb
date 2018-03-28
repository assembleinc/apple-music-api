require "spec_helper"
require "yaml"
require "pry"

RSpec.shared_examples 'it inherits from Apple::Music::Base' do
  describe '#attributes' do
    let(:attributes) { object.attributes }

    it 'is hashable' do
      expect(attributes).to be_an_instance_of Hash
      expect(object.attrs).to equal attributes
      expect(object.to_h).to equal attributes
      expect(object.to_hash).to equal attributes
    end

    it 'responds to #href' do
      expect(object).to respond_to :href
    end

    it 'has a type' do
      expect(object).to respond_to :type
      expect(object.type).to be_an_instance_of String
    end

    it 'has relationships' do
      expect(object).to respond_to :relationships
      expect(object.relationships).to be_an_instance_of Hash
    end

    it 'has a meta attributes' do
      expect(object).to respond_to :meta
    end

    it 'has query_options' do
      expect(object).to respond_to :query_options
    end

    it 'can have a client' do
      expect(object).to respond_to :client
    end
  end

  describe '#requery' do
    it 'can requery itself' do
      expect(object).to respond_to :requery
      expect(object).to respond_to :requeried?
    end
  end

  describe '#inspect' do
    it 'is inspectable' do
      expect(object).to respond_to :inspect
    end
  end
end

RSpec.shared_examples 'it has tracks' do |_|
end

RSpec.shared_examples 'it has artwork' do |_|
end

RSpec.describe Apple::Music do
  it 'has a version number' do
    expect(Apple::Music::VERSION).not_to be nil
  end
end

RSpec.describe Apple::Music::Error do
  ### ...
end

RSpec.describe Apple::Music::Artist do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Artist.new(load_fixture('artist').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'

  # context "since the artist fixtures were last updated" do
  #   it "should have the same structure" do
  #     artist_raw = load_fixture("artists/#{@artist_ids.first}.yaml")
  #     found_artist = @client.artist @artist_ids.first

  #     binding.pry
  #   end
  # end
end

RSpec.describe Apple::Music::Album do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Album.new(load_fixture('album').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'formattable', %i[ name url artist_name description
                                     description_short artwork_url tracks ]

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Activity do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Activity.new(load_fixture('activity').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Chart do
  # let(:client) { get_configured_client! }
  # let(:object) do
  #   Apple::Music::Chart.new(load_fixture('chart').to_h[:data].first,
  #                           {}, client)
  # end

  # it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::AppleCurator do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::AppleCurator.new(load_fixture('apple_curator').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Genre do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Genre.new(load_fixture('genre').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Curator do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Curator.new(load_fixture('curator').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::MusicVideo do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::MusicVideo.new(load_fixture('music_video').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Playlist do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Playlist.new(load_fixture('playlist').to_h[:data].first,
                               {}, client)
  end

  it_behaves_like 'formattable', %i[ name url description description_short
                                     artwork_url tracks curator_name
                                     curator_url ]

  it_behaves_like 'it inherits from Apple::Music::Base'

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
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Song.new(load_fixture('song').to_h[:data].first,
                           {}, client)
  end

  it_behaves_like 'formattable', %i[ id name artist_name artwork_url genres
                                     explicit preview url duration track_number
                                     is_preorder ]

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Station do
  let(:client) { get_configured_client! }
  let(:object) do
    Apple::Music::Station.new(load_fixture('station').to_h[:data].first,
                            {}, client)
  end

  it_behaves_like 'it inherits from Apple::Music::Base'
end

RSpec.describe Apple::Music::Storefront do
end
