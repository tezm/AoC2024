defmodule Aoc2024.Day3Test do
  use ExUnit.Case

  import Aoc2024.Day3

  test "part1" do
    input = "in/day3.example.in"
    answer = 161
    result = day3_part1(input)

    assert result == answer
  end

  test "part2" do
    input = "in/day3.part2.example.in"
    answer = 48
    result = day3_part2(input)

    assert result == answer
  end
end
