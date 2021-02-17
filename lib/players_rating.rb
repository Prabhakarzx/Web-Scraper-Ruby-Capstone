require_relative './constants.rb'
require_relative 'file_handler.rb'

class PlayersRating
  DIR_TYPE = 'PLAYERS'.freeze
  def initialize
    @players_file_array = FileHandler.access_all_players_files
    @file_name = nil
    filter_file_names
  end
end
