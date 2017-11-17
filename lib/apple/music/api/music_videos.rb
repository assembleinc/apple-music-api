require 'apple/music/api/utils'

module Apple
  module Music
    module API
      module MusicVideos
        include Apple::Music::API::Utils
        
        def music_video(id, options={})
          perform_get_object(Apple::Music::MusicVideo, "/v1/catalog/#{get_storefront}/music-videos/#{id}", options)
        end
        
        def music_videos(*args)
          options = args.last.is_a?(::Hash) ? args.pop : {}
          
          perform_get_objects(Apple::Music::MusicVideo, "/v1/catalog/#{get_storefront}/music-videos/", options.merge(ids: args.flatten.join(',')))
        end
        
      end
    end
  end
end
