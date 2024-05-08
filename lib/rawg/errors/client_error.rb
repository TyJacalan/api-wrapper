module Rawg
  module Errors
    class ClientError < StandardError
      attr_reader :response

      def initialize(response)
        @response = response
        super error
      end

      def error
        if response.is_a?(Hash) && response.key?('detail')
          response['detail']
        elsif response.is_a?(String)
          response
        else
          'Unknown client error'
        end
      end
    end
  end
end
