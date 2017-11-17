require 'apple/music/base'
require 'apple/music/relation/playlists'

module Apple
  module Music
    class AppleCurator < Apple::Music::Base
      object_relation_reader :Playlists, :playlists
      
      def name
        attributes[:name]
      end
      
      def url
        attributes[:url]
      end
      
    end
  end
end
