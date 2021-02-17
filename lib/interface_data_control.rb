require 'terminal-table'
require_relative './constants.rb'
require_relative './team_scraper.rb'
require_relative './player_scraper.rb'
require_relative './file_handler.rb'

class InterfaceDataControl
  attr_accessor :league
  def initialize; end

  def league_data_options(user_input)
    case user_input
    when 1
      @league = CLUB_WEBSITE.keys[user_input - 1]
    when 2
      @league = CLUB_WEBSITE.keys[user_input - 1]
    when 3
      @league = CLUB_WEBSITE.keys[user_input - 1]
    when 4
      @league = CLUB_WEBSITE.keys[user_input - 1]
    when 5
      @league = CLUB_WEBSITE.keys[user_input - 1]
    else
      return false
    end

    call_team_scraper
    call_player_scraper
  end
end