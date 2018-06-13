require 'net/http'
require 'uri'
require 'json'
require 'openssl'

module Apple
  module Music
    module API
      class Request
        BASE_URL = 'https://api.music.apple.com'.freeze

        def initialize(client, request_method, path, options = {})
          @client = client
          @uri = URI.parse(path.start_with?('http') ? path : BASE_URL + path)
          @request_method = request_method
          @path = @uri.path
          @options = options
        end

        def perform
          response = case @request_method
          when :get
            perform_get
          else
            # raise some sort of error
            Apple::Music::Error::BadRequestMethod.new(body, code)
          end

          fail_or_return_parsed_body(response.code, response.body)
        end

        def perform_get
          @uri.query = Rack::Utils.build_nested_query(clean_options)

          request = Net::HTTP::Get.new(@uri)
          request['Authorization'] = "Bearer #{@client.token}"

          Net::HTTP.start(@uri.hostname, @uri.port, use_ssl: true) do |http|
            http.request(request)
          end
        end

        private

        def fail_or_return_parsed_body(code, body)
          error = error(code, body)
          raise(error) if error

          symbolize_keys!(JSON.parse(body))
        end

        def error(code, body)
          # TODO: handle all status codes differently
          case code.to_i
          when 200
            return
          when 400
            Apple::Music::Error::BadRequestMethod.new(body, code)
          when 404
            Apple::Music::Error::NotFound.new(body, code)
          when 500
            Apple::Music::Error::ServerError.new(body, code)
          else
            Apple::Music::Error.new(body, code)
          end
        end

        def clean_options
          @options.reject{|k,v| v.nil? || (!v.is_a?(Integer) && v.empty?) }
        end

        def symbolize_keys!(object)
          if object.is_a?(Array)
            object.each_with_index do |val, index|
              object[index] = symbolize_keys!(val)
            end
          elsif object.is_a?(Hash)
            object.keys.each do |key|
              object[key.to_sym] = symbolize_keys!(object.delete(key))
            end
          end
          object
        end

      end
    end
  end
end
