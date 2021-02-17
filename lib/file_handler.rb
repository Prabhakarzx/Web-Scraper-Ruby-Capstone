require_relative './constants.rb'
require 'json'
require 'fileutils'
class FileHandler
  def initialize(hash, file_name)
    @hash = hash
    @file_name = file_name
  end

  def teams_to_json
    dir_maker(TEAM_DIR)
    File.write("#{TEAM_DIR}#{@file_name}.json", JSON.pretty_generate(@hash))
  end

  

  private

  def dir_maker(dir)
    FileUtils.mkdir_p(dir) unless File.exist?(dir)
  end
end
