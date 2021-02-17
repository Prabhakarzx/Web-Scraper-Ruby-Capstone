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

end
