defmodule Mix.Tasks.Day4.Part2 do
  use Mix.Task

  import Aoc2024.Day4

  @shortdoc "Day 4 Part 2"
  def run(args) do
    input = "in/day4.in"

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> day4_part2() end}),
      else:
        input
        |> day4_part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
