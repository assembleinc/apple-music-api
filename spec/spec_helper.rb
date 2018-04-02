require 'bundler/setup'
require 'apple/music'
require 'constants'
require 'shared_examples'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def load_fixture(path)
  file = File.open("spec/fixtures/#{path}.yaml")
  YAML.load file
end

def configured_client!
  Apple::Music.configure do |config|
    config.secret_key = ENV['APPLE_MUSIC_SECRET_KEY'] or raise 'Unable to set Apple::Music secret_key!'
    config.key_id     = ENV['APPLE_MUSIC_KEY_ID']     or raise 'Unable to set Apple::Music key_id!'
    config.team_id    = ENV['APPLE_MUSIC_TEAM_ID']    or raise 'Unable to set Apple::Music team_id!'
  end

  Apple::Music::Client.new
end
