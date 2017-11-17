require 'apple/music/base'
require 'apple/music/relation/albums'

module Apple
  module Music
    class Artist < Apple::Music::Base
      object_relation_reader :Albums, :albums
      
    end
  end
end
