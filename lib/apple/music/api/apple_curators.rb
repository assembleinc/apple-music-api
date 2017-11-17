require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module AppleCurators
        include Apple::Music::API::Utils
        
        def apple_curator(id, options={})
          perform_get_object(Apple::Music::AppleCurator, "/v1/catalog/#{get_storefront}/apple-curators/#{id}", options)
        end
        
        def apple_curators(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::AppleCurator, "/v1/catalog/#{get_storefront}/apple-curators/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
