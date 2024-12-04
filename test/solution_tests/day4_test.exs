defmodule Aoc2024.Day4Test do
  use ExUnit.Case

  import Aoc2024.Day4

  # @tag :skip
  test "part1" do
    input = "in/day4.example.in"
    answer = 18
    result = day4_part1(input)

    assert result == answer
  end

  #  @tag :skip
  test "part2" do
    input = "in/day4.example.in"
    answer = 9
    result = day4_part2(input)

    assert result == answer
  end
end
