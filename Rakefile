require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

def load_client!
  Apple::Music.configure do |config|
    config.secret_key = ENV['APPLE_MUSIC_SECRET_KEY']
    config.key_id     = ENV['APPLE_MUSIC_KEY_ID']
    config.team_id    = ENV['APPLE_MUSIC_TEAM_ID']
  end

  Apple::Music::Client.new
end

task :console do
  require 'pry'
  require 'apple-music'

  def reload!
    $VERBOSE = nil

    files = $LOADED_FEATURES.select { |feat| feat =~ /\/apple\-music\// }
    files.each { |file| load file }

    true
  end

  ARGV.clear

  @client = load_client!
  Pry.start
end

namespace :fixtures do
  require 'pry'
  require 'apple-music'
  require_relative 'spec/constants'

  @client = load_client!

  desc 'Refetch and rewrite fixture files using responses if sucessful'
  task :write do

    puts "Rake Task fixtures:write beginning"

    ## TODO: add to responses when suites are there
    #
    # charts: @client.perform_get("/v1/catalog/#{get_storefront}/charts/")

    def write_response_to_fixture_file!(type, response)
      file_path = "spec/fixtures/#{type}.yaml"
      file_contents = response.to_yaml

      File.open(file_path, 'w') { |f| f.write(file_contents) }
    end

    STOREFRONT = ENV['STOREFRONT'] || 'us'

    responses = {
             artist: @client.perform_get("/v1/catalog/#{STOREFRONT}/artists/#{ARTIST_ID}"),
              album: @client.perform_get("/v1/catalog/#{STOREFRONT}/albums/#{ALBUM_ID}"),
           playlist: @client.perform_get("/v1/catalog/#{STOREFRONT}/playlists/#{PLAYLIST_ID}"),
      apple_curator: @client.perform_get("/v1/catalog/#{STOREFRONT}/apple-curators/#{APPLE_CURATOR_ID}"),
            curator: @client.perform_get("/v1/catalog/#{STOREFRONT}/curators/#{CURATOR_ID}"),
        music_video: @client.perform_get("/v1/catalog/#{STOREFRONT}/music-videos/#{MUSIC_VIDEO_ID}"),
               song: @client.perform_get("/v1/catalog/#{STOREFRONT}/songs/#{SONG_ID}"),
            station: @client.perform_get("/v1/catalog/#{STOREFRONT}/stations/#{STATION_ID}"),
         storefront: @client.perform_get("/v1/storefronts/#{STOREFRONT}"),
           activity: @client.perform_get("/v1/catalog/#{STOREFRONT}/activities/#{ACTIVITY_ID}"),
              genre: @client.perform_get("/v1/catalog/#{STOREFRONT}/genres/#{GENRE_ID}"),
    }

    puts "Writing YAML fixtures for types #{responses.keys.join(', ')}"

    responses.each_pair { |type, response| write_response_to_fixture_file!(type, response) }

    puts "Rake Task fixtures:write finished"
  end
end
