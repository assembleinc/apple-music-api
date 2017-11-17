require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Artists
        include Apple::Music::API::Utils
        
        def artist(id, options={})
          perform_get_object(Apple::Music::Artist, "/v1/catalog/#{get_storefront}/artists/#{id}", options)
        end
        
        def artists(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Artist, "/v1/catalog/#{get_storefront}/artists/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
