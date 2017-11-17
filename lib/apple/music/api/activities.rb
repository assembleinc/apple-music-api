require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Activities
        include Apple::Music::API::Utils
        
        def activity(id, options={})
          perform_get_object(Apple::Music::Activity, "/v1/catalog/#{get_storefront}/activities/#{id}", options)
        end
        
        def activities(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Activity, "/v1/catalog/#{get_storefront}/activities/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
