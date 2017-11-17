require 'apple/music/relation/base'

module Apple
  module Music
    module Relation
      class Genres < Apple::Music::Relation::Base
        
        def item_klass
          Apple::Music::Genre
        end
        
      end
    end
  end
end
