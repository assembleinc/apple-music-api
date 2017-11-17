require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Charts
        include Apple::Music::API::Utils
        
        def charts(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Chart, "/v1/catalog/#{get_storefront}/charts/", options.merge(types: args))
        end
        
      end
    end
  end
end
