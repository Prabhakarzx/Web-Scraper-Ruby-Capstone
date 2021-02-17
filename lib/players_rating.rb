require_relative './constants.rb'
require_relative 'file_handler.rb'

class PlayersRating
  DIR_TYPE = 'PLAYERS'.freeze
  def initialize
    @players_file_array = FileHandler.access_all_players_files
    @file_name = nil
    filter_file_names
  end

  def filter_file_names
    @players_file_array.length.times do |i|
      @file_name = @players_file_array[i]
      filter_players(FileHandler.file_reader(DIR_TYPE, @file_name))
    end
  end

  def filter_players(player_hash)
    player_hash.each do |_club, player|
      player.each do |_player_name, attrib|
        rate_players(attrib)
      end
    end
    FileHandler.new(player_hash, File.basename(@file_name, '.json')).players_to_json
  end
end
