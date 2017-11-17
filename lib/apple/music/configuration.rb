module Apple
  module Music
    class Configuration
    
      attr_accessor :secret_key, :key_id, :team_id, :algorithm

      def initialize
        @algorithm = 'ES256'
      end

    end

  end
end
