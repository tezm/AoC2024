defmodule Mix.Tasks.Day5.Part2 do
  use Mix.Task

  import Aoc2024.Day5

  @shortdoc "Day 5 Part 2"
  def run(args) do
    input = "in/day5.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day5_part2() end}),
      else:
        input
        |> day5_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
