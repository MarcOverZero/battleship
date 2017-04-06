require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_a_board
    board = Board.new

    assert_equal ({ "A1"=> 0,
                  "A2"=> 0,
                  "A3"=> 0,
                  "A4"=> 0,

                  "B1"=> 0,
                  "B2"=> 0,
                  "B3"=> 0,
                  "B4"=> 0,

                  "C1"=> 0,
                  "C2"=> 0,
                  "C3"=> 0,
                  "C4"=> 0,

                  "D1"=> 0,
                  "D2"=> 0,
                  "D3"=> 0,
                  "D4"=> 0
                  }), board.coords
  end
  def test_coords_default_to_a_zero_placeholder
    board = Board.new

    assert_equal 0, board.coords["D3"]
  end


  def test_it_can_print_pretty
    skip
    #visual check
    board = Board.new

    assert_nil board.display
  end
end
