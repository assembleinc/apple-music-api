require 'bundler/gem_tasks'

require 'apple/music'
require 'rspec/core/rake_task'
require 'pry'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :load_client do
  Apple::Music.configure do |config|
    config.secret_key = ENV['APPLE_MUSIC_SECRET_KEY']
    config.key_id     = ENV['APPLE_MUSIC_KEY_ID']
    config.team_id    = ENV['APPLE_MUSIC_TEAM_ID']
  end

  Apple::Music::Client.new
end

task :console do
  def reload!
    $VERBOSE = nil

    files = $LOADED_FEATURES.select { |feat| feat =~ /\/apple\-music\// }
    files.each { |file| load file }

    true
  end

  def load_client
    Rake::Task['load_client'].invoke
  end

  ARGV.clear
  Pry.start
end
