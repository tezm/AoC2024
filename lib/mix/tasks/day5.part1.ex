defmodule Mix.Tasks.Day5.Part1 do
  use Mix.Task

  import Aoc2024.Day5

  @shortdoc "Day 5 Part 1"
  def run(args) do
    input = "in/day5.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day5_part1() end}),
      else:
        input
        |> day5_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
