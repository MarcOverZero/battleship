require './test/test_helper'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_it_exists
    battleship = Battleship.new

    assert_instance_of Battleship, battleship
  end

  def test_it_can_make_a_ready_board_state
    battleship = Battleship.new


    assert_instance_of Board, battleship.blank_board
  end

  def test_computer_can_place_a_big_ship
    battleship = Battleship.new

    refute_nil true, battleship.computer_big_ship_placement
  end
end
