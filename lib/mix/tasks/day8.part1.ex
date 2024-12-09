defmodule Mix.Tasks.Day8.Part1 do
  use Mix.Task

  import Aoc2024.Day8

  @shortdoc "Day 8 Part 1"
  def run(args) do
    input = "in/day8.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day8_part1() end}),
      else:
        input
        |> day8_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
