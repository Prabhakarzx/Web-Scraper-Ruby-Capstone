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

  private

  def add_clubs_url
    team_json_file = FileHandler.file_reader(DIR_TYPE, @league)
    team_json_file.each do |club, attrib|
      @url_hash.merge!(club => SITE + attrib['url'])
    end
    parse_players
  end

  def parse_players
    @url_hash.each_with_index do |(team_name, url), index|
      @url = url
      parsed_url = parse
      parsed_url.xpath('//comment()').each { |comment| comment.replace(comment.text) }
      print_player_node(team_name, index)
      scrap_players(parsed_url, team_name)
    end
    PlayersRating.new
  end
end
