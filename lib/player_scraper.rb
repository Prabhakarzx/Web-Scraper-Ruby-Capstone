require_relative './constants.rb'
require_relative './parser.rb'
require_relative './file_handler.rb'
require_relative './players_rating.rb'
require_relative './show_status.rb'

class PlayerScraper < Parser
  include ShowStatus
  DIR_TYPE = 'CLUBS'.freeze
  SITE = 'https://fbref.com'.freeze
  def initialize(league)
    @league = league
    @url_hash = {}
    add_clubs_url
  end
end