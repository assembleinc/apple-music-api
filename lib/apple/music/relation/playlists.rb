require 'apple/music/relation/base'

module Apple
  module Music
    module Relation
      class Playlists < Apple::Music::Relation::Base
        
        def item_klass
          Apple::Music::Playlist
        end
        
      end
    end
  end
end
