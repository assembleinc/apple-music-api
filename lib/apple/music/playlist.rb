require 'apple/music/base'
require 'apple/music/artwork'
require 'apple/music/relation/tracks'

module Apple
  module Music
    class Playlist < Apple::Music::Base
      object_attr_reader :Artwork, :artwork
      object_relation_reader :Tracks, :tracks
      
      def formatted
        data = {
          name: name,
          url: url,
          description: description,
          description_short: description_short,
          artwork_url: raw_artwork_url,
          tracks: tracks.map(&:formatted)
        }
        
        if curator.nil?
          data[:curator_name] = attributes[:curatorName]
        else
          data[:curator_name] = curator.name
          data[:curator_url] = curator.url
        end
        
        data
      end
      
      def url
        attributes[:url]
      end
      
      def name
        attributes[:name]
      end
      
      def description
        attributes[:description] ? (attributes[:description][:standard] || attributes[:description][:short]) : ""
      end
      
      def description_short
        attributes[:description] ? (attributes[:description][:short] || "") : ""
      end
      
      def raw_artwork_url
        attributes[:artwork] ? attributes[:artwork][:url].sub(/http:\/\/(.+?)\./, 'https://\1-ssl.') : ""
      end
      
      def curator # HACK: do better
        return nil if relationships[:curator][:data].nil? || relationships[:curator][:data].empty?
        
        @curator ||= begin
          data = relationships[:curator][:data].first
          
          klass = case data[:type]
          when "apple-curators"
            Apple::Music::AppleCurator
          else
            Apple::Music::Curator
          end
          
          curator = klass.new(data, @query_options, @client)
          curator.requery
          curator
        end
      end
      
    end
  end
end
