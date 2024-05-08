class GamesController < ApplicationController
  before_action :set_client, only: [:show]

  def index
    @games = Rails.cache.fetch('top_games', expires_in: 12.hours) do
      @client.games(metacritic: '80,100', page: 1)
    end
  end

  def show
    @game_id = params[:id]
    @achievements = fetch_from_cache_or_api('achievements')
    @additions =    fetch_from_cache_or_api('additions')
    @creators =     fetch_from_cache_or_api('development-team')
    @game =         fetch_from_cache_or_api
    @series =       fetch_from_cache_or_api('game-series')
    @trailer =      fetch_from_cache_or_api('movies')
  end

  private

  def set_client
    @client ||= Rawg::Api::V2::Client.new
  end

  def fetch_from_cache_or_api(endpoint = nil)
    Rails.cache.fetch("game_#{params[:id]}_#{endpoint}", expires_in: 12.hours) do
      if endpoint
        @client.games(@game_id, endpoint)
      else
        @client.games(@game_id)
      end
    end
  end
end
