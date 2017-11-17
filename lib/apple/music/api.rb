require 'apple/music/api/activities'
require 'apple/music/api/albums'
require 'apple/music/api/apple_curators'
require 'apple/music/api/artists'
require 'apple/music/api/charts'
require 'apple/music/api/curators'
require 'apple/music/api/genres'
require 'apple/music/api/music_videos'
require 'apple/music/api/playlists'
require 'apple/music/api/search'
require 'apple/music/api/songs'
require 'apple/music/api/stations'
require 'apple/music/api/storefronts'

module Apple
  module Music
      module API
        include Apple::Music::API::Activities
        include Apple::Music::API::Albums
        include Apple::Music::API::AppleCurators
        include Apple::Music::API::Artists
        include Apple::Music::API::Charts
        include Apple::Music::API::Curators
        include Apple::Music::API::Genres
        include Apple::Music::API::MusicVideos
        include Apple::Music::API::Playlists
        include Apple::Music::API::Search
        include Apple::Music::API::Songs
        include Apple::Music::API::Stations
        include Apple::Music::API::Storefronts
      end
    end
end
