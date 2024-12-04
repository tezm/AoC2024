defmodule Mix.Tasks.Day3.Part1 do
  use Mix.Task

  import Aoc2024.Day3

  @shortdoc "Day 3 Part 1"
  def run(args) do
    input = "in/day3.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day3_part1() end}),
      else:
        input
        |> day3_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
