defmodule Mix.Tasks.Day8.Part2 do
  use Mix.Task

  import Aoc2024.Day8

  @shortdoc "Day 8 Part 2"
  def run(args) do
    input = "in/day8.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day8_part2() end}),
      else:
        input
        |> day8_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
