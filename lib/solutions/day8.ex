defmodule Aoc2024.Day8 do
  @splitter "\n"
  defp read_input(path) do
    File.read!(path)
    |> String.split(@splitter, trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  def gen_antinoides({x1, y1}, _, acc, row_max, col_max)
      when x1 < 0 or y1 < 0 or x1 >= row_max or y1 >= col_max do
    acc
  end

  def gen_antinoides({x1, y1}, {x2, y2}, acc, row_max, col_max) do
    x_new = 2 * x2 - x1
    y_new = 2 * y2 - y1
    gen_antinoides({x2, y2}, {x_new, y_new}, [{x1, y1} | acc], row_max, col_max)
  end

  def day8_part1(path) do
    input = read_input(path)
    row_max = Enum.count(input)
    col_max = Enum.count(Enum.at(input, 0))

    Enum.zip(0..(Enum.count(input) - 1), input)
    |> Enum.flat_map(fn {x, row} ->
      Enum.zip(0..(Enum.count(row) - 1), row)
      |> Enum.map(fn {y, el} -> {{x, y}, el} end)
    end)
    |> Enum.into(%{})
    |> Enum.reduce(%{}, fn {key, val}, acc ->
      Map.update(acc, val, MapSet.new([key]), fn set -> MapSet.put(set, key) end)
    end)
    |> Enum.filter(fn {key, _} -> key != "." end)
    |> Enum.flat_map(fn {_, set} ->
      Enum.flat_map(set, fn {x, y} ->
        Enum.map(MapSet.delete(set, {x, y}), fn el -> {{x, y}, el} end)
      end)
    end)
    |> Enum.map(fn {{x1, y1}, {x2, y2}} -> {2 * x2 - x1, 2 * y2 - y1} end)
    |> Enum.filter(fn {x, y} -> x >= 0 and y >= 0 and x < row_max and y < col_max end)
    |> Enum.uniq()
    |> Enum.count()
  end

  def day8_part2(path) do
    input = read_input(path)

    row_max = Enum.count(input)
    col_max = Enum.count(Enum.at(input, 0))

    Enum.zip(0..(Enum.count(input) - 1), input)
    |> Enum.flat_map(fn {x, row} ->
      Enum.zip(0..(Enum.count(row) - 1), row)
      |> Enum.map(fn {y, el} -> {{x, y}, el} end)
    end)
    |> Enum.into(%{})
    |> Enum.reduce(%{}, fn {key, val}, acc ->
      Map.update(acc, val, MapSet.new([key]), fn set -> MapSet.put(set, key) end)
    end)
    |> Enum.filter(fn {key, _} -> key != "." end)
    |> Enum.flat_map(fn {_, set} ->
      Enum.flat_map(set, fn {x, y} ->
        Enum.map(MapSet.delete(set, {x, y}), fn el -> {{x, y}, el} end)
      end)
    end)
    |> Enum.flat_map(fn {e1, e2} -> gen_antinoides(e1, e2, [], row_max, col_max) end)
    |> Enum.uniq()
    |> Enum.count()
  end
end
