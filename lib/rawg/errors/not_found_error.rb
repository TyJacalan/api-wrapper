module Rawg
  module Errors
    class NotFoundError < StandardError
      def initialize(key, response)
        @response = response
        @key = key
        super "#{key.capitalize} Not Found"
      end
    end
  end
end
