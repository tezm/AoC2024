defmodule Mix.Tasks.Day7.Part2 do
  use Mix.Task

  import Aoc2024.Day7

  @shortdoc "Day 7 Part 2"
  def run(args) do
    input = "in/day7.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day7_part2() end}),
      else:
        input
        |> day7_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
