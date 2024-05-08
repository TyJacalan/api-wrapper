module Rawg
  module Endpoints
    module CreatorRoles
      def creator_roles(**params)
        request(
          method: :get,
          endpoint: 'creator-roles',
          params: params
        )
      rescue Faraday::ResourceNotFound => e
        raise Rawg::Errors::NotFoundError.new(:creator_role, e)
      end
    end
  end
end
