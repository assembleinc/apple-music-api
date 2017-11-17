require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Albums
        include Apple::Music::API::Utils
        
        def album(id, options={})
          perform_get_object(Apple::Music::Album, "/v1/catalog/#{get_storefront}/albums/#{id}", options)
        end
        
        def albums(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Album, "/v1/catalog/#{get_storefront}/albums/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
