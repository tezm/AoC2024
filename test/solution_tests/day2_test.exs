defmodule Aoc2024.Day2Test do
  use ExUnit.Case

  import Aoc2024.Day2

  test "part1" do
    input = "in/day2.example.in"
    answer = 2
    result = day2_part1(input)

    assert result == answer
  end

  test "part2" do
    input = "in/day2.example.in"
    answer = 4
    result = day2_part2(input)

    assert result == answer
  end
end
