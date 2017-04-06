
module ShipDeployer

  def check_input_length(coordinates)
    if coordinates.length == 5?
      true
    end
  end

  def check_input_formatting(coordinates)
    if coordinates[2] == " "
      true
    end
  end

  def check_ship_orientation(coordinates)
    @vertical = false
    if coordinates[0] == coordinates[3]
      @vertical = false
    elsif coordinates[1] == coordinates[4]
      vertical = true
    else
      @vertical = nil
    end
  end

  def check_appropriate_small_ship_length(coordinates)
    if @vertical == false
      true if (coordinates[4].to_i - coordinates[1].to_i) == 1
    elsif @vertical == true
      true if (coordinates[3].ord - coordinates[0].to_i) == 1
    end
  end

  def real_coordinates_bow?(coordinates, board)
    board.coords.keys.include?(coordinates[0..1])
  end

  def real_coordinates_stern?(coordinates, board)
    board.coords.keys.include?(coordinates[3..4])
  end
"The coordinates you gave or not on the map, please choose coordinates between A1 and D4."

  def coordinates_available?(coordinates, board, ship_size)
    if ship_size == "small"
      if board.coordinates[0..1] == 0 && board.coordinates[3..4] == 0
        true
    elsif board.coordinates[0..1] !== 0 && board.coordinates[0..1] !== 0 || board.coordinates[3..4] !== 0
      false
    end
    if board.coords[0..1] !== 0 && board.coords !== 0
      false
    else
      true

    # if available == false, "one or more of those squares is occuppied" print board
    #else assign coordinate values
  end

  def ship_placement(coordinates, ship_size, board)
     if ship_size == "small"
       board.coords.coordinates.[0..1] = "s"
       board.coords.coordinates.[3..4] = "s"
     end
     if ship_size == "big"
        if vertical == true
          board.coords.coordinates.[0..1] = "S"
          board.coords.coordinates.["#{coordinates[0]}#{coordinates[1].succ}"] = "S"
          board.coords.coordinates.[3..4] = "S"
        elsif vertical == false
          board.coords.coordinates.[0..1] = "S"
          board.coords.coordinates.["#{coordinates[0].succ}#{coordinates[1]}"] = "S"
          board.coords.coordinates.[3..4] = "S"
        end
      end
      puts "Admiral, #{ship_size} ship deployed to #{coordinates}!"
      true
  end
end
