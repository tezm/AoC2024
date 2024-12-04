defmodule Mix.Tasks.Day1.Part1 do
  use Mix.Task

  import Aoc2024.Day1

  @shortdoc "Day 1 Part 1"
  def run(args) do
    input = "in/day1.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day1_part1() end}),
      else:
        input
        |> day1_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
