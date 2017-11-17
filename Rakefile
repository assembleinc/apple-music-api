require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  require 'pry'
  require 'apple-music'
  
  def reload!
    $VERBOSE = nil
    
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/apple\-music\// }
    files.each { |file| load file }
    
    true
  end
  
  def load_client
    Apple::Music.configure do |config|
      config.secret_key = ENV['APPLE_MUSIC_SECRET_KEY']
      config.key_id     = ENV['APPLE_MUSIC_KEY_ID']
      config.team_id    = ENV['APPLE_MUSIC_TEAM_ID']
    end
    
    Apple::Music::Client.new
  end
  
  ARGV.clear
  Pry.start
end
