defmodule Mix.Tasks.Day2.Part1 do
  use Mix.Task

  import Aoc2024.Day2

  @shortdoc "Day 2 Part 1"
  def run(args) do
    input = "in/day2.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day2_part1() end}),
      else:
        input
        |> day2_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
