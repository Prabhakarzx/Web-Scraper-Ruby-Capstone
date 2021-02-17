module ShowStatus
  def print_league_node(current_node)
    puts "Loading team data about #{current_node}"
  end

  def print_player_node(current_node, num)
    puts "Loading player data about #{current_node}"
    num.times { print '||' }
    print " #{num * 5} % \n"
  end
  end
