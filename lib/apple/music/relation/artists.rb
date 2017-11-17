require 'apple/music/relation/base'

module Apple
  module Music
    module Relation
      class Artists < Apple::Music::Relation::Base
        
        def item_klass
          Apple::Music::Artist
        end
        
      end
    end
  end
end
