module Rawg
  module Endpoints
    module Developers
      def developers(id = nil, **params)
        request(
          method: :get,
          endpoint: id ? "developers/#{id}" : 'developers',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:developer, e)
      end
    end
  end
end
