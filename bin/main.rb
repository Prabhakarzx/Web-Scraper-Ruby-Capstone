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
end
