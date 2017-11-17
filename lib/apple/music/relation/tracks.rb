require 'apple/music/relation/base'

module Apple
  module Music
    module Relation
      class Tracks < Apple::Music::Relation::Base
        
        def item_klass
          Apple::Music::Song
        end
        
        def full_items?
          true
        end
        
      end
    end
  end
end
