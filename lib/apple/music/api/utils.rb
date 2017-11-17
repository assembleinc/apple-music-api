require 'apple/music/api/request'

module Apple
  module Music
    module API
      module Utils
        
        def perform_get(path, options = {})
          perform_request(:get, path, options)
        end
        
        def perform_request(request_method, path, options = {})
          Apple::Music::API::Request.new(self, request_method, path, options).perform
        end
        
        def perform_get_object(klass, path, options = {})
          result = perform_get(path, options)
          klass.new(result[:data].first, options, self)
        end
        
        def perform_get_objects(klass, path, options = {})
          results = perform_get(path, options)
          
          results[:data].collect do |item|
            klass.new(item, options, self)
          end
        end
        
      end
    end
  end
end
