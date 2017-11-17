module Apple
  module Music
    class Error < StandardError
      attr_reader :code, :json
      
      # generic 4xx error
      ClientError = Class.new(self)
      
      # 404
      NotFound = Class.new(ClientError)
      
      # generic 5xx error
      ServerError = Class.new(self)
      
      # other errors
      BadRequestMethod = Class.new(self)
      
      ERRORS = {
        404 => Apple::Music::Error::NotFound
      }.freeze
      
      def initialize(message = '', code = nil)
        super(message)
        @json = JSON.parse(message)
        @code = code
      end
    end
  end
end
