#!/usr/bin/env ruby

require 'colorize'
require 'terminal-table'
require_relative '../lib/interface_data_control.rb'
require_relative '../lib/constants.rb'
class Main
  def initialize
    @interface = InterfaceDataControl.new
    @data_shelf = []
    welcome_interface
  end

  private

  def welcome_interface
    divide(1)
    divide(1)
    puts "\n\t\t\t\t Welcome to Soccer Scraper \n\n"
    divide(1)
    divide(1)
    puts "\n"
    main_option
  end

  def main_option
    $stdout.sync = true
    puts "\n\t\t Choose Which Football league Stat You Want to Get \n"
    puts "\n\t\t 1.English_Premier_League \n"
    puts "\n\t\t 2.Spain_La_Liga \n"
    puts "\n\t\t 3.Germany_Bundesliga \n"
    puts "\n\t\t 4.Italian_Serie_A \n"
    puts "\n\t\t 5.France_Ligue1 \n"
    puts "\n\t\t 6.Exit \n".red
    option = validate((1..6), gets.chomp.to_i)
    abort_program(2) if option == 6
    @league_chosen = CLUB_WEBSITE.keys[option - 1]
    clear_screen
    @interface.league = CLUB_WEBSITE.keys[option - 1]
    @interface.league_data_options(option) if @data_shelf.none?(option)
    @data_shelf << option if @data_shelf.none?(option)
    clear_screen
    team_option
  end

  def team_option
    divide(1)
    puts "\n\t\t Select the desired data to display\n"
    puts "\n\t\t 1.League Table \n"
    puts "\n\t\t 2.Team Statistics \n"
    puts "\n\t\t 3.Suggest Best XI \n"
    puts "\n\t\t 4.Best Forward \n"
    puts "\n\t\t 5.Best Midfielder \n"
    puts "\n\t\t 6.Best Defender \n"
    puts "\n\t\t 7.Best Goalkeeper \n"
    puts "\n\t\t 8.Exit \n".red
    option = validate((1..8), gets.chomp.to_i)
    abort_program(2) if option == 8
    clear_screen
    if option == 1
      league_table_interface
    elsif option == 2
      players_table_interface
    else
      suggest_players(option)
    end
  end

  def league_table_interface
    loading_interface
    divide(1)
    data = @interface.gets_league_hash
    rows = []
    data.values.length.times do |k|
      row = []
      (data.values[k].values.length - 1).times do |l|
        row << data.values[k].values[l]
      end
      rows << row
    end
    table = Terminal::Table.new headings: TEAM_STAT_TYPE, rows: rows
    puts table
    navigate
  end

  def players_table_interface
    divide(1)
    teams = @interface.gets_team_hash
    puts "\n\t\t Select the team of your choice \n"
    teams.length.times do |i|
      puts "#{i + 1} #{teams[i]}"
    end
    option = validate((1..20), gets.chomp.to_i)
    loading_interface
    player_data = @interface.gets_player_hash(@league_chosen, option)
    header = %w[Name N P A MP S Mi G A PK PKA YC RC G90 A90 GA90 T TW BL In InB CL Er AR DR]

    table = Terminal::Table.new headings: header, rows: player_data[option - 1]
    puts table
    navigate
  end
end
