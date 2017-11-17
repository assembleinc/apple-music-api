require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Stations
        include Apple::Music::API::Utils
        
        def station(id, options={})
          perform_get_object(Apple::Music::Station, "/v1/catalog/#{get_storefront}/stations/#{id}", options)
        end
        
        def stations(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Station, "/v1/catalog/#{get_storefront}/stations/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
