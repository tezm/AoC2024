defmodule Mix.Tasks.Day7.Part1 do
  use Mix.Task

  import Aoc2024.Day7

  @shortdoc "Day 7 Part 1"
  def run(args) do
    input = "in/day7.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day7_part1() end}),
      else:
        input
        |> day7_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
