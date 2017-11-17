require 'apple/music/base'
require 'apple/music/artwork'
require 'apple/music/relation/tracks'
require 'apple/music/relation/artists'


module Apple
  module Music
    class Album < Apple::Music::Base
      object_attr_reader :Artwork, :artwork
      object_relation_reader :Tracks, :tracks
      object_relation_reader :Artists, :artists
      
      resource_attr_reader :name, :url, :artist_name
      
      def formatted
        data = {
          name: name,
          url: url,
          artist_name: artist_name,
          description: description,
          description_short: description_short,
          artwork_url: raw_artwork_url,
          tracks: tracks.map(&:formatted)
        }
        
        data
      end
      
      def description
        attributes[:editorialNotes] ? (attributes[:editorialNotes][:standard] || attributes[:editorialNotes][:short]) : ""
      end
      
      def description_short
        attributes[:editorialNotes] ? (attributes[:editorialNotes][:short] || "") : ""
      end
      
      def raw_artwork_url
        attributes[:artwork][:url].sub(/http:\/\/(.+?)\./, 'https://\1-ssl.')
      end
      
    end
  end
end
