defmodule Aoc2024.Day3 do
  @pattern_part1 ~r/mul\((\d{0,3}),(\d{0,3})\)/
  @pattern_part2 ~r/mul\((\d{0,3}),(\d{0,3})\)|do\(\)|don't\(\)/
  def read_input(path) do
    File.read!(path)
  end

  def day3_part1(path) do
    input = read_input(path)

    Regex.scan(@pattern_part1, input)
    |> Enum.map(fn match ->
      String.to_integer(Enum.at(match, 1)) * String.to_integer(Enum.at(match, 2))
    end)
    |> Enum.sum()
  end

  def mul_reduce(list) do
    mul_reduce(list, 1, 0)
  end

  defp mul_reduce([head | tail], mul, acc) do
    case head do
      ["do()"] ->
        mul_reduce(tail, 1, acc)

      ["don't()"] ->
        mul_reduce(tail, 0, acc)

      _ ->
        mul_reduce(
          tail,
          mul,
          acc + mul * String.to_integer(Enum.at(head, 1)) * String.to_integer(Enum.at(head, 2))
        )
    end
  end

  defp mul_reduce([], _mul, acc) do
    acc
  end

  def day3_part2(path) do
    input = read_input(path)

    Regex.scan(@pattern_part2, input)
    |> mul_reduce()
  end
end
