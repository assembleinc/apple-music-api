require 'jwt'
require 'apple/music/api'

module Apple
  module Music
    class Client
      include Apple::Music::API
      
      attr_reader :token
      
      def initialize(storefront: nil)
        set_storefront (storefront || 'us')
        generate_token
      end
      
      def generate_token
        @token = JWT.encode(payload, OpenSSL::PKey::EC.new(Apple::Music.configuration.secret_key), Apple::Music.configuration.algorithm, header_fields)
      end
      
      def set_storefront(new_storefront)
        @storefront = new_storefront
      end
      
      def get_storefront
        @storefront
      end
      
      protected
      
      def header_fields
        {
          alg: Apple::Music.configuration.algorithm,
          kid: Apple::Music.configuration.key_id
        }
      end
      
      def payload
        time = Time.now.to_i
        {
          iss: Apple::Music.configuration.team_id,
          iat: time,
          exp: (time + (60 * 60 * 24))
        }
      end
      
    end
  end
end
