module GamesHelper
  def format_game_description(description)
    "<div class='game-description'>#{description}</div>".html_safe
  end
end
