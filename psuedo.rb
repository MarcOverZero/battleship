Boards

  clean board
    empty board, printed in instructions
  end

  ai_ships
    holds computer placed ships
    will need own class of ComputerShipPlacement
    also use of module ShipPlacementValidation
  end

  user_ships
    holds user ships & placement
    will need module ShipPlacementValidation
  end

  user_interface
    displays Hs & Ms that the user has shot at
    shooting process will have to check back against ai_ships
  end
end

module ShipPlacementValidation

** module accessible to AI ship placement & User ship placement
  may need a User?= boolean starts as false for AI to run through placement.
    if true, THEN the error messages print/puts
  user ship placement should p / puts messages dependant on returns from validation module
  maybe methods return an error number to correspond with message
  oh good, you're trying to place a ship.'
  require './lib/board'
  takes string & boat size as an argument on initialization of the chosen board.
    two coordinate string format.
  check_input_length
    checks to see if it's a valid string' ->  string.count == 5?
  end
  check_input_formatting
    checks to see if string[2] is == to " "
    if not: invalid entry, please enter two coordinates corresponding to where you would like to place each end of your ship
  end
  check_ship_orientation
    are the letters the same? set vertical boolean false
    are the numbers the same? set vertical boolean true
    if neither
        diagonal error message
  check_appropriate_ship_length
    letters same? check number delta against ship size, good? next
      otherwise error message
    numbers same? check letter.orb delta against ship size, good? next
      otherwise error message

  end
  check_available coordinates
    if string[0..1] & string[3..4] are present in available coordinates
      in local non-module class make available_coordinates as instance variable where every time a ship is placed those coordinates are deleted from the available keys
          when deleted from available keys, those key values also get pushed into an "occuppied" array list
          "occuppied" is a seperate instance variable
          SO, if available, shovel a copy into "occuppied" then delete the matching key:pair from available
          if not available, check occuppied
              if in occuppied, say so
              if not occuppied, tell 'em to stay on the board'
  end
  coordinate_validation
    all that other stuff was good, so:
     if ship is small
       shovel coords into "occuppied" & delete them from "available"
     if ship is big
        check vertical boolean,
          if vertical, add a first letter.succ + number_coord to "occuppied" & delete that from available
          if horizontal, add a first number.succ + letter_coord to "occuppied" & delete that from available
    "Admiral, #{size corresponding} ship deployed to #{coordinates}!"

    failure results in a "nope" method
    nope(error message number)
      if user? = false
        run ComputerShipDeployment.little_ship
      else
        puts signified error message

  end

end

ComputerShipDeployment
  big_ship_placement
    vertical = [true, false].sample
    bow = coords.keys.sample
    if vertical
        stern = "#{(bow[0].succ).succ} #{bow[1]}"
    if not vertical
        stern = "#{(bow[0].succ).succ} #{bow[1]}"
  end

  little_ship_placement
    vertical = [true, false].sample
    bow = coords.keys.sample
    if vertical
        stern = "#{(bow[0].succ).succ} #{bow[1]}"
        validate
    if not vertical
        stern = "#{(bow[0].succ).succ} #{bow[1]}"
        validate
  end
end

UserShipDeployment
  little_ship_placement
    @ship_size = 2
    prompts
    "Your first ship only occupies two coordinates.
     Please enter two coordinates orienting the ship either vertically or horizontally"
     little_ship_placement = gets.upcase.chomp
     validation_gambit(little_ship_placement)
  end

  big_ship_placement
    @ship_size = 3
    prompts
    "Your second ship occupies three coordinates.
     Please enter two coordinates corresponding with the ends of the ship and orienting the ship either vertically or horizontally"
     big_ship_placement = gets.upcase.chomp
     validation_gambit(big_ship_placement)
   end
 end

 class Battle
  def start
    @computer_shot_menu = user_ship_deployment.keys
    @battle_start = Time.now
    "We are ready for battle!"
    user_shoots
  end

  def user_shoots
    UserInterfaceMap.display_board
    puts "Enter a single coordinate you would like to fire on."
    shot = gets.upcase.chomp
    user_hit?(shot)
  end

  def user_hit?(shot)
    if @user_aggressor = true
      if ComputerShipPlacement.coords.keys(shot).include?
        if ComputerShipPlacement.coords[shot] == 0
          puts "Miss!"
          UserInterfaceMap.coords[shot] = "M"
          @user_aggressor = false
        elsif ComputerShipPlacement.coords[shot] == "M" || ComputerShipPlacement.coords[shot] == "H"
          puts "You have already shot at this coordinate, please try another."
          user_shoots
        elsif ComputerShipPlacement.coords[shot].downcase == "s"
          puts "Hit!"
          user_hit(shot)
        else
          puts "I'm sorry, I didn't quite get that, please enter a coordinate to fire upon."
          user_shoots
        end
      else
          "Your shot of #{shot} is not on the map, please choose a coordinate between A1 & D4."
          user_shoots
      end
    end
  end

  def user_hit(shot)
    UserInterfaceMap.coords[shot] = "H"
    @user_aggressor = false
    if ComputerShipPlacement.coords[shot] == "s"
      if ComputerShipPlacement.coords.[shot] == "s" && ComputerShipPlacement.values.count("s") > 1
        ComputerShipPlacement.coords[shot] = "H"
        computer_shoots
      elsif ComputerShipPlacement.coords.[shot] == "s" && ComputerShipPlacement.values.count("s") == 1
        puts "You sunk a small ship!"
        ComputerShipPlacement.coords[shot] = "H"
        if ComputerShipPlacement.values.count("S") > 0
          computer_shoots
        else
          end_game("VICTORIOUS")
      elsif ComputerShipPlacement.coords.[shot] == "S" && ComputerShipPlacement.values.count("S") > 1
        ComputerShipPlacement.coords[shot] = "H"
        computer_shoots
      elsif ComputerShipPlacement.coords.[shot] == "S" && ComputerShipPlacement.values.count("S") == 1
        puts "You sunk a big ship!"
        ComputerShipPlacement.coords[shot] = "H"
        if ComputerShipPlacement.values.count("s") > 0
          computer_shoots
        else
          end_game("VICTORIOUS")
      end
    end
  end

  def computer_shoots
    shot = user_ship_deployment.sample
    user_ship_deployment.delete(shot)
    computer_hit?(shot)
  end

  def computer_hit?(shot)
    if user_ship_deployment.coords[shot] == 0
      puts "The enemy missed us, admiral!"
    elsif user_ship_deployment.coords[shot].downcase == "s"
      computer_hit(shot)
    end
  end

  def computer_hit(shot)
    if user_ship_deployment.coords.[shot] == "s" && user_ship_deployment.values.count("s") > 1
      puts "The enemy hit our small ship!"
      user_ship_deployment.coords[shot] = "H"
      user_shoots
    elsif user_ship_deployment.coords.[shot] == "s" && user_ship_deployment.values.count("s") == 1
      puts "Admiral, the enemy sunk our small ship!"
      user_ship_deployment.coords[shot] = "H"
      if user_ship_deployment.values.count("S") > 0
        user_shoots
      else
        end_game("DEFEATED")
    elsif user_ship_deployment.coords.[shot] == "S" && user_ship_deployment.values.count("S") > 1
      puts "The enemy hit our big ship!"
      user_ship_deployment.coords[shot] = "H"
      user_shoots
    elsif user_ship_deployment.coords.[shot] == "S" && user_ship_deployment.values.count("S") == 1
      puts "Admiral, the enemy sunk our big ship!"
      user_ship_deployment.coords[shot] = "H"
      if user_ship_deployment.values.count("s") > 0
        user_shoots
      else
        end_game("DEFEATED")
      end
    end
  end

def end_game(outcome)
  user_interface_map.display_board
  puts "Look at the sea, you were #{outcome} in this battle, admiral! It took a mere #{@battle_start - Time.new} seconds. "
  exit
end
