require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Genres
        include Apple::Music::API::Utils
        
        def genre(id, options={})
          perform_get_object(Apple::Music::Genre, "/v1/catalog/#{get_storefront}/genres/#{id}", options)
        end
        
        def genres(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Genre, "/v1/catalog/#{get_storefront}/genres/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
