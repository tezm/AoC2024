defmodule Aoc2024.Day5Test do
  use ExUnit.Case

  import Aoc2024.Day5

  # @tag :skip
  test "part1" do
    input = "in/day5.example.in"
    answer = 143
    result = day5_part1(input)

    assert result == answer
  end

  # @tag :skip
  test "part2" do
    input = "in/day5.example.in"
    answer = 123
    result = day5_part2(input)

    assert result == answer
  end
end
