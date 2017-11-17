require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Curators
        include Apple::Music::API::Utils
        
        def curator(id, options={})
          perform_get_object(Apple::Music::Curator, "/v1/catalog/#{get_storefront}/curators/#{id}", options)
        end
        
        def curators(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Curator, "/v1/catalog/#{get_storefront}/curators/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
