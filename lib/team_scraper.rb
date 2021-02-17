require_relative './constants.rb'
require_relative './parser.rb'
require_relative './file_handler'
require_relative './show_status.rb'

class TeamScraper < Parser
  include ShowStatus

  def initialize(url, league)
    @url = url
    @league = league
    @team_hash = {}
    parse_teams
  end
end