require 'date'

require 'apple/music/version'

require 'apple/music/configuration'
require 'apple/music/error'
require 'apple/music/client'
require 'apple/music/activity'
require 'apple/music/album'
require 'apple/music/apple_curator'
require 'apple/music/artist'
require 'apple/music/chart'
require 'apple/music/curator'
require 'apple/music/genre'
require 'apple/music/music_video'
require 'apple/music/playlist'
require 'apple/music/song'
require 'apple/music/station'
require 'apple/music/storefront'

module Apple
  module Music

    class << self
      attr_writer :configuration
    end

    def self.configuration
      @configuration ||= Apple::Music::Configuration.new
    end

    def self.configure
      yield(configuration) if block_given?
    end

  end
end
