defmodule Aoc2024.Day7Test do
  use ExUnit.Case

  import Aoc2024.Day7

  # @tag :skip
  test "part1" do
    input = "in/day7.example.in"
    answer = 3749
    result = day7_part1(input)

    assert result == answer
  end

  # @tag :skip
  test "part2" do
    input = "in/day7.example.in"
    answer = 11387
    result = day7_part2(input)

    assert result == answer
  end
end
