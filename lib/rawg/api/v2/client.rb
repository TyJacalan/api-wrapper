class Rawg::Api::V2::Client
  include Rawg::Endpoints::CreatorRoles
  include Rawg::Endpoints::Creators
  include Rawg::Endpoints::Developers
  include Rawg::Endpoints::Games
  include Rawg::Endpoints::Genres
  include Rawg::Endpoints::Platforms
  include Rawg::Endpoints::Publishers
  include Rawg::Endpoints::Stores
  include Rawg::Endpoints::Tags

  BASE_URL = Rails.application.credentials.RAWG_BASE_URL.freeze
  API_KEY = Rails.application.credentials.RAWG_API_KEY

  private

  def request(method:, endpoint:, params: {}, headers: {}, body: {})
    response = connection.public_send(method, "#{endpoint}") do |request|
      request.params = { key: API_KEY, **params }
      request.headers = headers   if headers.present?
      request.body = body.to_json if body.present?
    end

    handle_response(response)
  end

  def handle_response(response)
    case response.status
    when 200..299
      JSON.parse(response.body).with_indifferent_access if response.success?
    when 404
      raise Faraday::ResourceNotFound, response.body
    when 403
      raise Rawg::Errors::PermissionDeniedError, response.body
    else
      raise Rawg::Errors::ClientError, response.body
    end
  end

  def connection
    @connection ||= Faraday.new(url: BASE_URL)
  end
end
