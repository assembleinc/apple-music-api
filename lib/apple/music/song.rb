require 'apple/music/base'
require 'apple/music/relation/albums'
require 'apple/music/relation/artists'
require 'apple/music/relation/genres'

module Apple
  module Music
    class Song < Apple::Music::Base
      object_attr_reader :Artwork, :artwork
      object_relation_reader :Albums, :albums
      object_relation_reader :Artists, :artists
      object_relation_reader :Genres, :genres
      
      resource_attr_reader :name, :url, :artist_name, :genre_names, :track_number, :release_date
      
      def formatted
        {
          id: @id,
          name: name,
          artist_name: artist_name,
          artwork_url: artwork.attributes[:url],
          genres:  genre_names,
          explicit: explicit?,
          preview: preview,
          url: url,
          duration: duration,
          track_number: track_number,
          is_preorder: is_preorder
        }
      end
      
      def is_preorder
        current_time = Time.now.utc
        current_date = current_time.isdst ? current_time.getlocal("-07:00").to_date : current_time.getlocal("-08:00").to_date
        
        Date.parse(release_date) > current_date
      end
      
      def duration
        attributes[:durationInMillis] / 1000
      end
      
      def explicit?
        attributes[:contentRating].nil? ? false : !attributes[:contentRating].match(/explicit/i).nil?
      end
      
      def preview
        attributes[:previews].first.nil? ? nil : (attributes[:previews].first[:url] || nil)
      end
      
    end
  end
end
