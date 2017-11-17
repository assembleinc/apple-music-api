require 'apple/music/relation/base'

module Apple
  module Music
    module Relation
      class Albums < Apple::Music::Relation::Base
        
        def item_klass
          Apple::Music::Album
        end
        
      end
    end
  end
end
