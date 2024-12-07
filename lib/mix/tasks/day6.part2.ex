defmodule Mix.Tasks.Day6.Part2 do
  use Mix.Task

  import Aoc2024.Day6

  @shortdoc "Day 6 Part 2"
  def run(args) do
    input = "in/day6.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day6_part2() end}),
      else:
        input
        |> day6_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
