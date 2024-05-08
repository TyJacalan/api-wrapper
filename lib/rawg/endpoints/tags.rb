module Rawg
  module Endpoints
    module Tags
      def tags(id = nil, **params)
        request(
          method: :get,
          endpoint: id ? "tags/#{id}" : 'tags',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:tag, e)
      end
    end
  end
end
