defmodule Mix.Tasks.Day3.Part2 do
  use Mix.Task

  import Aoc2024.Day3

  @shortdoc "Day 3 Part 2"
  def run(args) do
    input = "in/day3.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day3_part2() end}),
      else:
        input
        |> day3_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
