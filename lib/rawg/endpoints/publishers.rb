module Rawg
  module Endpoints
    module Publishers
      def publishers(id = nil, **params)
        request(
          method: :get,
          endpoint: id ? "publishers/#{id}" : 'publishers',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:publisher, e)
      end
    end
  end
end
