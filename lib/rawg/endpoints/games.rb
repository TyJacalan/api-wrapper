module Rawg
  module Endpoints
    module Games
      def games(id = nil, suffix = nil, **params)
        endpoint = build_games_endpoint(suffix, id)
        request(
          method: :get,
          endpoint: endpoint,
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:game, e)
      end

      private

      def build_games_endpoint(suffix, id)
        endpoint = 'games'
        endpoint += "/#{id}" if id
        endpoint += "/#{suffix}" if suffix
        endpoint
      end
    end
  end
end
