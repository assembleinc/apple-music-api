require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Search
        include Apple::Music::API::Utils
        
        def search(term, options={})
          perform_get("/v1/catalog/#{get_storefront}/search/", options.merge(term: term))
        end
        
        def hint(term, options={})
          perform_get("/v1/catalog/#{get_storefront}/search/hints/", options.merge(term: term))
        end
        
      end
    end
  end
end
