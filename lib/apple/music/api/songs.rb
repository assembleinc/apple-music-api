require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Songs
        include Apple::Music::API::Utils
        
        def song(id, options={})
          perform_get_object(Apple::Music::Song, "/v1/catalog/#{get_storefront}/songs/#{id}", options)
        end
        
        def songs(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Song, "/v1/catalog/#{get_storefront}/songs/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
