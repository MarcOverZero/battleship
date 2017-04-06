class Board
  attr_accessor :coords
  def initialize
    @coords = { "A1"=> 0,
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
              }
  end

  def display
    header = "~~~~~~~~~~~~~~~~"
    row_1 = '*  1   2   3   4'
    row_2 = "A  #{coords["A1"]}   #{coords["A2"]}   #{coords["A3"]}   #{coords["A4"]}"
    row_3 = "B  #{coords["B1"]}   #{coords["B2"]}   #{coords["B3"]}   #{coords["B4"]}"
    row_4 = "C  #{coords["C1"]}   #{coords["C2"]}   #{coords["C3"]}   #{coords["C4"]}"
    row_5 = "D  #{coords["D1"]}   #{coords["D2"]}   #{coords["D3"]}   #{coords["D4"]}"
    footer= "~~~~~~~~~~~~~~~~"
    puts header + "\n" + row_1 + "\n" + row_2 + "\n" + row_3 + "\n" + row_4 + "\n" + row_5 + "\n" + footer
  end
end
