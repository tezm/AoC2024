defmodule Aoc2024.Day1Test do
  use ExUnit.Case

  import Aoc2024.Day1

  test "part1" do
    input = "in/day1.example.in"
    answer = 11
    result = day1_part1(input)

    assert result == answer
  end

  test "part2" do
    input = "in/day1.example.in"
    answer = 31
    result = day1_part2(input)

    assert result == answer
  end
end
