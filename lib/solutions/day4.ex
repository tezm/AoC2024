defmodule Aoc2024.Day4 do
  @splitter "\n"
  @word "XMAS"
  @word_rev String.reverse(@word)
  defp read_input(path) do
    File.read!(path)
    |> String.split(@splitter, trim: true)
  end

  defp count_occ(str, patt) do
    Enum.map(0..(String.length(str) - String.length(patt)), fn pos ->
      String.slice(str, pos, 4)
    end)
    |> Enum.filter(fn str -> str == patt end)
    |> Enum.count()
  end

  defp count_horizontal(input, patt) do
    Enum.map(input, &count_occ(&1, patt))
    |> Enum.sum()
  end

  defp count_vertical(input, patt) do
    Enum.map(input, &String.graphemes/1)
    |> Enum.zip()
    |> Enum.map(fn el -> el |> Tuple.to_list() |> Enum.join() end)
    |> count_horizontal(patt)
  end

  defp count_diagonal_left(input, patt) do
    lenght = String.length(Enum.at(input, 0))

    Enum.zip(input, (lenght - 1)..0)
    |> Enum.map(fn {str, x} ->
      String.duplicate("_", x) <> str <> String.duplicate("_", lenght - 1 - x)
    end)
    |> count_vertical(patt)
  end

  defp count_diagonal_right(input, patt) do
    lenght = String.length(Enum.at(input, 0))

    Enum.zip(input, (lenght - 1)..0)
    |> Enum.map(fn {str, x} ->
      String.duplicate("_", lenght - 1 - x) <> str <> String.duplicate("_", x)
    end)
    |> count_vertical(patt)
  end

  def take_3(str) do
    Enum.map(0..(String.length(str) - 3), fn pos ->
      String.slice(str, pos, 3)
    end)
  end

  def is_xmas(
        "M" <> <<_::binary-size(1)>> <> "M",
        <<_::binary-size(1)>> <> "A" <> <<_::binary-size(1)>>,
        "S" <> <<_::binary-size(1)>> <> "S"
      ) do
    true
  end

  def is_xmas(
        "S" <> <<_::binary-size(1)>> <> "S",
        <<_::binary-size(1)>> <> "A" <> <<_::binary-size(1)>>,
        "M" <> <<_::binary-size(1)>> <> "M"
      ) do
    true
  end

  def is_xmas(
        "M" <> <<_::binary-size(1)>> <> "S",
        <<_::binary-size(1)>> <> "A" <> <<_::binary-size(1)>>,
        "M" <> <<_::binary-size(1)>> <> "S"
      ) do
    true
  end

  def is_xmas(
        "S" <> <<_::binary-size(1)>> <> "M",
        <<_::binary-size(1)>> <> "A" <> <<_::binary-size(1)>>,
        "S" <> <<_::binary-size(1)>> <> "M"
      ) do
    true
  end

  def is_xmas(_, _, _) do
    false
  end

  def day4_part1(path) do
    input = read_input(path)

    count_horizontal(input, @word) + count_horizontal(input, @word_rev) +
      count_vertical(input, @word) + count_vertical(input, @word_rev) +
      count_diagonal_left(input, @word) + count_diagonal_left(input, @word_rev) +
      count_diagonal_right(input, @word) + count_diagonal_right(input, @word_rev)
  end

  def day4_part2(path) do
    input = read_input(path)

    Enum.zip([input, Enum.slice(input, 1..-1//1), Enum.slice(input, 2..-1//1)])
    |> Enum.map(fn {x, y, z} -> Enum.zip([take_3(x), take_3(y), take_3(z)]) end)
    |> List.flatten()
    |> Enum.filter(fn {x, y, z} -> is_xmas(x, y, z) end)
    |> Enum.count()
  end
end
