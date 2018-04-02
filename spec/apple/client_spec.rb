require 'spec_helper'
require 'yaml'
require 'pry'

RSpec.describe Apple::Music::Client do
  before :each do
    @client = configured_client!
  end

  describe '#search' do
    let(:search_term) { 'james' }

    let(:random_storefront) do
      @client.storefronts.sample
    end

    let(:search_params) do
      types = %w[ activities artists apple-curators
                  albums curators songs playlists
                  music-videos stations ].join(',')

      { l: random_storefront.attributes[:defaultLanguageTag],
        limit: 25,
        offset: 3,
        types: types }
    end

    it "can perform a search in #{STOREFRONTS_TO_TEST} random Storefronts" do
      STOREFRONTS.sample(STOREFRONTS_TO_TEST).each do |sf|
        @client.set_storefront(sf)
        expect(@client.search(SEARCH_TERM)).
          to be_an_instance_of Hash
      end
    end

    it 'can perform a more advanced search' do
      @client.set_storefront(random_storefront.id)
      search_results = @client.search(search_term, search_params.to_h)

      expect(search_results[:results]).
        to be_an_instance_of Hash
    end
  end

  describe '#activity' do
    it 'can get an activity given an id' do
      expect(@client.activity(ACTIVITY_ID)).
        to be_an_instance_of Apple::Music::Activity
    end
  end

  describe '#album' do
    it 'can get an album given an id' do
      expect(@client.album(ALBUM_ID)).
        to be_an_instance_of Apple::Music::Album
    end
  end

  describe '#apple_curator' do
    it 'can get an apple curator given an id' do
      expect(@client.apple_curator(APPLE_CURATOR_ID)).
        to be_an_instance_of Apple::Music::AppleCurator
    end
  end

  describe '#artist' do
    it 'can get an artist given an id' do
      expect(@client.artist(ARTIST_ID)).
        to be_an_instance_of Apple::Music::Artist
    end
  end

  describe '#curator' do
    it 'can get a curator given an id' do
      expect(@client.curator(CURATOR_ID)).
        to be_an_instance_of Apple::Music::Curator
    end
  end

  describe '#genre' do
    it 'can get a genre given an id' do
      expect(@client.genre(GENRE_ID)).
        to be_an_instance_of Apple::Music::Genre
    end
  end

  describe '#music_video' do
    it 'can get a music video given an id' do
      expect(@client.music_video(MUSIC_VIDEO_ID)).
        to be_an_instance_of Apple::Music::MusicVideo
    end
  end

  describe '#playlist' do
    it 'can get a playlist given an id' do
      expect(@client.playlist(PLAYLIST_ID)).
        to be_an_instance_of Apple::Music::Playlist
    end
  end

  describe '#song' do
    it 'can get an song given an id' do
      expect(@client.song(SONG_ID)).
        to be_an_instance_of Apple::Music::Song
    end
  end

  describe '#station' do
    it 'can get a station given an id' do
      expect(@client.station(STATION_ID)).
        to be_an_instance_of Apple::Music::Station
    end
  end

  describe '#storefronts' do
    it 'can get a list of storefronts' do
      expect(@client.storefronts.map(&:class).uniq).
        to eq([Apple::Music::Storefront])
    end
  end
end
