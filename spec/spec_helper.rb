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

RSpec.shared_examples 'formattable' do |attributes|
  context 'Ocelot dependency' do
    describe '#formatted' do
      let(:formatted) { object.formatted }

      it 'can get a formatted version of an object' do
        expect(formatted).to be_an_instance_of Hash
      end

      attributes.each do |attribute|
        it "contains #{attribute}" do
          expect(formatted[attribute]).not_to be nil
        end
      end
    end
  end
end
