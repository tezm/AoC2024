defmodule Mix.Tasks.Day1.Part2 do
  use Mix.Task

  import Aoc2024.Day1

  @shortdoc "Day 1 Part 2"
  def run(args) do
    input = "in/day1.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day1_part2() end}),
      else:
        input
        |> day1_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
