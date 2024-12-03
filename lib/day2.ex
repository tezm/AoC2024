defmodule Day2 do
  @line_spliter "\n"
  @word_spliter " "
  def read_input(path) do
    File.read!(path)
    |> String.split(@line_spliter, trim: true)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, @word_spliter, trim: true))
    |> Stream.map(&Enum.map(&1, fn x -> String.to_integer(x) end))
  end

  def check_safety(list) do
    diff = Enum.zip_with(list, Enum.slice(list, 1..-1//1), fn x, y -> x - y end)

    Enum.filter(diff, fn x -> x in 1..3//1 end) |> Enum.count() == Enum.count(list) - 1 or
      Enum.filter(diff, fn x -> x in -1..-3//-1 end) |> Enum.count() == Enum.count(list) - 1
  end

  def day2_part1(path) do
    input = read_input(path) |> Enum.to_list()

    Enum.reduce(input, 0, fn list, acc ->
      cond do
        check_safety(list) -> 1
        true -> 0
      end + acc
    end)
  end

  def activate_dampener(list, range) do
    activate_dampener(list, range, [])
  end

  defp activate_dampener([x, y | tail], range, acc) do
    if Enum.member?(range, x - y) do
      activate_dampener([y | tail], range, [x | acc])
    else
      check_safety(Enum.reverse(acc) ++ [x | tail]) or
        check_safety(Enum.reverse(acc) ++ [y | tail])
    end
  end

  defp activate_dampener([x], _range, acc) do
    check_safety(Enum.reverse([x | acc]))
  end

  def day2_part2(path) do
    input = read_input(path) |> Enum.to_list()

    Enum.reduce(input, 0, fn list, acc ->
      cond do
        activate_dampener(list, 1..3//1) ->
          1

        activate_dampener(list, -1..-3//-1) ->
          1

        true ->
          0
      end + acc
    end)
  end
end
