defmodule Aoc2024.Day6Test do
  use ExUnit.Case

  import Aoc2024.Day6

  # @tag :skip
  test "part1" do
    input = "in/day6.example.in"
    answer = 41
    result = day6_part1(input)

    assert result == answer
  end

  # @tag :skip
  test "part2" do
    input = "in/day6.example.in"
    answer = 6
    result = day6_part2(input)

    assert result == answer
  end
end
