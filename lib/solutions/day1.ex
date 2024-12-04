defmodule Aoc2024.Day1 do
  @spliter ~r{\s}
  def read_word_by_word(file_path) do
    File.read!(file_path)
    |> String.split(@spliter, trim: true)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end

  def get_input(file_path) do
    {list1, list2} =
      read_word_by_word(file_path)
      |> Enum.to_list()
      |> Enum.with_index()
      |> Enum.split_with(fn {_k, v} -> rem(v, 2) == 0 end)

    {list1 |> Enum.map(&elem(&1, 0)), list2 |> Enum.map(&elem(&1, 0))}
  end

  def count_occ(list) do
    list
    |> Enum.reduce(%{}, fn char, acc ->
      Map.put(acc, char, (acc[char] || 0) + 1)
    end)
  end

  def day1_part1(file_path) do
    {list1, list2} = get_input(file_path)

    [Enum.sort(list1), Enum.sort(list2)]
    |> Enum.zip_with(fn [x, y] -> abs(x - y) end)
    |> Enum.sum()
  end

  def day1_part2(file_path) do
    {list1, list2} = get_input(file_path)
    occ = count_occ(list2)
    Enum.map(list1, fn x -> (occ[x] || 0) * x end) |> Enum.sum()
  end
end
