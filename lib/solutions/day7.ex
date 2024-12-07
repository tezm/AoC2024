defmodule Aoc2024.Day7 do
  @splitter "\n"
  defp read_input(path) do
    File.read!(path)
    |> String.split(@splitter, trim: true)
  end

  defp check_true({0, []}, _) do
    true
  end

  defp check_true({+0.0, []}, _) do
    true
  end

  defp check_true({-0.0, []}, _) do
    true
  end

  defp check_true({_, []}, _) do
    false
  end

  defp check_true({res, [x | rest]}, :part1) do
    check_true({res / x, rest}, :part1) or
      check_true({res - x, rest}, :part1)
  end

  defp check_true({res, [x | rest]}, :part2) do
    check_true({res / x, rest}, :part2) or
      check_true({res - x, rest}, :part2) or
      check_true({(res - x) / 10 ** String.length(Integer.to_string(x)), rest}, :part2)
  end

  def day7_part1(path) do
    input = read_input(path)

    Enum.map(input, &String.split(&1, ":", trim: true))
    |> Enum.map(&List.to_tuple/1)
    |> Enum.map(fn {res, el} ->
      {String.to_integer(res),
       String.split(el, " ", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.reverse()}
    end)
    |> Enum.filter(&check_true(&1, :part1))
    |> Enum.reduce(0, fn {res, _}, acc -> acc + res end)
  end

  def day7_part2(path) do
    input = read_input(path)

    Enum.map(input, &String.split(&1, ":", trim: true))
    |> Enum.map(&List.to_tuple/1)
    |> Enum.map(fn {res, el} ->
      {String.to_integer(res),
       String.split(el, " ", trim: true) |> Enum.map(&String.to_integer/1) |> Enum.reverse()}
    end)
    |> Enum.filter(&check_true(&1, :part2))
    |> Enum.reduce(0, fn {res, _}, acc -> acc + res end)
  end
end
