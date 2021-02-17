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
    puts "\n\t\t\t\t Choose Which Football league Stat You Want to Get \n"
    puts "\n\t\t\t\t 1.English_Premier_League \n"
    puts "\n\t\t\t\t 2.Spain_La_Liga \n"
    puts "\n\t\t\t\t 3.Germany_Bundesliga \n"
    puts "\n\t\t\t\t 4.Italian_Serie_A \n"
    puts "\n\t\t\t\t 5.France_Ligue1 \n"
    puts "\n\t\t\t\t 6.Exit \n".red
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
    puts "\n\t\t\t\t What Information you want to display \n"
    puts "\n\t\t\t\t 1.League table \n"
    puts "\n\t\t\t\t 2.Team stats \n"
    puts "\n\t\t\t\t 3.Suggest Best XI \n"
    puts "\n\t\t\t\t 4.Best Forward \n"
    puts "\n\t\t\t\t 5.Best midfielder \n"
    puts "\n\t\t\t\t 6.Best defender \n"
    puts "\n\t\t\t\t 7.Best GoalKeeper \n"
    puts "\n\t\t\t\t 8.Exit \n".red
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

end
