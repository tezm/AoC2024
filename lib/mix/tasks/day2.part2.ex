defmodule Mix.Tasks.Day2.Part2 do
  use Mix.Task

  import Aoc2024.Day2

  @shortdoc "Day 2 Part 2"
  def run(args) do
    input = "in/day2.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day2_part2() end}),
      else:
        input
        |> day2_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
