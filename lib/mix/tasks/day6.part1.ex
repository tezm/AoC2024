defmodule Mix.Tasks.Day6.Part1 do
  use Mix.Task

  import Aoc2024.Day6

  @shortdoc "Day 6 Part 1"
  def run(args) do
    input = "in/day6.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day6_part1() end}),
      else:
        input
        |> day6_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
