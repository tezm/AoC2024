defmodule Mix.Tasks.Day4.Part1 do
  use Mix.Task

  import Aoc2024.Day4

  @shortdoc "Day 4 Part 1"
  def run(args) do
    input = "in/day4.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> day4_part1() end}),
      else:
        input
        |> day4_part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
