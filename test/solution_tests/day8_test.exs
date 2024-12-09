defmodule Aoc2024.Day8Test do
  use ExUnit.Case

  import Aoc2024.Day8

  # @tag :skip
  test "part1" do
    input = "in/day8.example.in"
    answer = 14
    result = day8_part1(input)

    assert result == answer
  end

  # @tag :skip
  test "part2" do
    input = "in/day8.example.in"
    answer = 34
    result = day8_part2(input)

    assert result == answer
  end
end
