require "bundler/setup"
require "apple/music"
require "constants"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def load_fixture(path)
  file = File.open("spec/fixtures/" + path + ".yaml")
  YAML.load file
end

def configure_client!(config, env)
  config.secret_key = env['APPLE_MUSIC_SECRET_KEY'] or raise 'Unable to set Apple::Music secret_key!'
  config.key_id     = env['APPLE_MUSIC_KEY_ID']     or raise 'Unable to set Apple::Music key_id!'
  config.team_id    = env['APPLE_MUSIC_TEAM_ID']    or raise 'Unable to set Apple::Music team_id!'
end

def get_configured_client!
  Apple::Music.configure do |config|
    configure_client!(config, ENV)
  end

  Apple::Music::Client.new
end

RSpec.shared_examples 'chris_format' do |model, instance|
  case model
  when Apple::Music::Playlist
    ### Can get a formatted version of Playlist
    # @playlist.formatted

    ### Then can get Playlist Name
    # @playlist.formatted[:name]

    ### Then can get Playlist Url
    # @playlist.formatted[:url]

    ### Then can get Playlist Description
    # @playlist.formatted[:description]

    ### Then can get Playlist Description Short
    # @playlist.formatted[:description_short]

    ### Then can get Playlist Artwork Url
    # @playlist.formatted[:artwork_url]

    ### Then can get Playlist Tracks
    # @playlist.formatted[:tracks]

    ### Then can get Playlist Curator Name
    # @playlist.formatted[:curator_name]

    ### Then can get Playlist Curator Url
    # @playlist.formatted[:curator_url]

  when Apple::Music::Album
    ### Can get a formatted version of Album
    # @album.formatted

    ### Then can get Album Name
    # @album.formatted[:name]

    ### Then can get Album Url
    # @album.formatted[:url]

    ### Then can get Album Artist_name
    # @album.formatted[:artist_name]

    ### Then can get Album Description
    # @album.formatted[:description]

    ### Then can get Album Description Short
    # @album.formatted[:description_short]

    ### Then can get Album Artwork_url
    # @album.formatted[:artwork_url]

    ### Then can get Album Tracks
    # @album.formatted[:tracks]

  when Apple::Music::Song
    ### Can get a formatted version of Song
    # @song.formatted

    ### Then can get Song Id
    # @song.formatted[:id]

    ### Then can get Song Name
    # @song.formatted[:name]

    ### Then can get Song Artist Name
    # @song.formatted[:artist_name]

    ### Then can get Song Artwork Url
    # @song.formatted[:artwork_url]

    ### Then can get Song Genres
    # @song.formatted[:genres]

    ### Then can get Song Explicit
    # @song.formatted[:explicit]

    ### Then can get Song Preview
    # @song.formatted[:preview]

    ### Then can get Song Url
    # @song.formatted[:url]

    ### Then can get Song Duration
    # @song.formatted[:duration]

    ### Then can get Song Track Number
    # @song.formatted[:track_number]

    ### Then can get Song Is_preorder
    # @song.formatted[:is_preorder]

  end
end
