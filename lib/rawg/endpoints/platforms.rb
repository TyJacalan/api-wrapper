module Rawg
  module Endpoints
    module Platforms
      def platforms(**params)
        request(
          method: :get,
          endpoint: 'creator-roles',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:platform, e)
      end

      def parent_platforms(**params)
        request(
          method: :get,
          endpoint: 'platforms/lists/parents',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:parent_platform, e)
      end
    end
  end
end
