module Rawg
  module Endpoints
    module Genres
      def genres(id = nil, **params)
        request(
          method: :get,
          endpoint: id ? "genres/#{id}" : 'genres',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:genre, e)
      end
    end
  end
end
