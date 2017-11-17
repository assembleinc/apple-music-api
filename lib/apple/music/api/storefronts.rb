require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Storefronts
        include Apple::Music::API::Utils
        
        def storefront(id, options={})
          perform_get_object(Apple::Music::Storefront, "/v1/storefronts/#{id}", options)
        end
        
        def storefronts(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Storefront, "/v1/storefronts", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
