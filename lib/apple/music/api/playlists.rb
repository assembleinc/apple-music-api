require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module Playlists
        include Apple::Music::API::Utils
        
        def playlist(id, options={})
          perform_get_object(Apple::Music::Playlist, "/v1/catalog/#{get_storefront}/playlists/#{id}", options)
        end
        
        def playlists(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::Playlist, "/v1/catalog/#{get_storefront}/playlists/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
