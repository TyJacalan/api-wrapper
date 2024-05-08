module Rawg
  module Endpoints
    module Stores
      def stores(id = nil, **params)
        request(
          method: :get,
          endpoint: id ? "stores/#{id}" : 'stores',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:store, e)
      end
    end
  end
end
