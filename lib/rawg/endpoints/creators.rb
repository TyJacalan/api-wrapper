module Rawg
  module Endpoints
    module Creators
      def creators(id = nil, **params)
        request(
          method: :get,
          endpoint: id ? "creators/#{id}" : 'creators',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:creator, e)
      end
    end
  end
end
