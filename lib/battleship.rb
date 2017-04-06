require 'pry'
require './lib/board'
require './lib/ship_deployer'
# require './lib/messages'

class Battleship
  extend ShipDeployer
  # include Messages
  attr_accessor :blank_board, :computer_board_state, :user_board_state, :user_shots_state
  def initialize
    @blank_board = Board.new
    @computer_board_state = Board.new
    @user_board_state = Board.new
    @user_shots_state = Board.new
  end

  def welcome
    "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @user_input = gets.downcase.chomp
    welcome_parse(@user_input)
  end

  def welcome_parse(input)
    if input == "p"
      setup
    elsif input == "i"
      instructions
    else input == "q"
      exit
    end
  end

  def instructions
    puts "Start by deploying your ships on the board's coordinates.
    \nYou have two ships, a two-unit boat and a three-unit boat.
    \nShips must be placed on valid coordinates within the board, you will be notified if your coordinates are erroneous.
    \nPlease follow the rules for ship placement:
    \n\t* Ships cannot overlap.
    \n\t* The board is not a torus, ships cannot wrap around the edges of the board.
    \n\t* Ships may be placed horizontally or vertically.
    \n\t* Ships coordinates must match size of the ship using a coordinate for each end.
    \n\t* Sink your opponent, or rue the day!"

    blank_board.display

    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @user_input = gets.downcase.chomp
    welcome_parse(@user_input)
  end



  def setup
    computer_big_ship_placement
  end

  def computer_big_ship_placement
    vertical = [true, false].sample
    bow = computer_board_state.coords.keys.sample
    if vertical == true
      stern = "#{bow[0].succ.succ} #{bow[1]}"
    end
    if not vertical == false
      stern = "#{bow[0]} #{bow[1].succ.succ}"
    end
    binding.pry
    ship_placement("#{bow} #{stern}", "big", computer_board_state)
  end
end

# ***************************
    # def little_ship_placement
    #   vertical = [true, false].sample
    #   bow = coords.keys.sample
    #   if vertical
    #       stern = "#{(bow[0].succ).succ} #{bow[1]}"
    #       coordinates_available(computer_board_state)
    #   end
    #   if not vertical
    #     stern = "#{(bow[0].succ).succ} #{bow[1]}"
    #     coordinates_available(computer_board_state, "small")
    #   end
    # end

#
#   def battle
#
#
#   end
#
#
#
# end




  #
  # UserShipDeployment
  # little_ship_placement
  #   @ship_size = "small"
  #   prompts
  #   "Your first ship only occupies two coordinates.
  #    Please enter two coordinates orienting the ship either vertically or horizontally"
  #    little_ship_placement = gets.upcase.chomp
  #    validation_gambit(little_ship_placement)
  # end
  #
  # big_ship_placement
  #   @ship_size = "big"
  #   prompts
  #   "Your second ship occupies three coordinates.
  #    Please enter two coordinates corresponding with the ends of the ship and orienting the ship either vertically or horizontally"
  #    big_ship_placement = gets.upcase.chomp
  #    validation_gambit(big_ship_placement)
  #  end
  # end

  # def computer_ship_placement_message
  #   """
  #   \nI have laid out my ships on the grid.
  #   \nYou now need to layout your two ships.
  #   \nThe first is two units long and the second is three units long.
  #   \nThe grid has A1 at the top left and D4 at the bottom right.
  #   \n\nEnter the squares for the two-unit ship:
  #   """
  # end


#
# if __FILE__ == $0
#   Battleship.new
# end
