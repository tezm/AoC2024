defmodule Aoc2024.Day5 do
  @splitter "\n"
  defp read_input(path) do
    File.read!(path)
    |> String.split(@splitter, trim: true)
  end

  defp check_rule_book(<<_::binary-size(2)>> <> "|" <> <<_::binary-size(2)>>) do
    true
  end

  defp check_rule_book(_) do
    false
  end

  defp parse_rule(<<x::binary-size(2)>> <> "|" <> <<y::binary-size(2)>>) do
    x_num = String.to_integer(x)
    y_num = String.to_integer(y)
    {x_num, y_num}
  end

  defp parse_comands(comand) do
    comand
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp generate_rule_book(rule_list) do
    Enum.reduce(rule_list, %{}, fn {x, y}, acc ->
      Map.update(acc, x, MapSet.new([y]), fn set -> MapSet.put(set, y) end)
    end)
  end

  defp check_order(rule_book, comand) do
    Enum.map(
      0..(Enum.count(comand) - 1),
      &{Enum.at(comand, &1), MapSet.new(Enum.slice(comand, 0, &1))}
    )
    |> Enum.filter(fn {el, set} ->
      MapSet.intersection(set, Map.get(rule_book, el, MapSet.new())) != MapSet.new()
    end) == []
  end

  defp find_next(el, [], _, _) do
    el
  end

  defp find_next(_, [head | _], set, rule_book) do
    find_next(
      head,
      Enum.to_list(MapSet.intersection(set, Map.get(rule_book, head, MapSet.new()))),
      set,
      rule_book
    )
  end

  defp generate_order([head | tail], rule_book) do
    next = find_next(head, tail, MapSet.new([head | tail]), rule_book)
    [next | generate_order(List.delete([head | tail], next), rule_book)]
  end

  defp generate_order([], _) do
    []
  end

  def day5_part1(path) do
    input = read_input(path)

    {rules, comands} = Enum.split_with(input, &check_rule_book/1)

    rule_book =
      Enum.map(rules, &parse_rule/1)
      |> generate_rule_book()

    Enum.map(comands, &parse_comands/1)
    |> Enum.filter(&check_order(rule_book, &1))
    |> Enum.map(&Enum.at(&1, div(Enum.count(&1) - 1, 2)))
    |> Enum.sum()
  end

  def day5_part2(path) do
    input = read_input(path)

    {rules, comands} = Enum.split_with(input, &check_rule_book/1)

    rule_book =
      Enum.map(rules, &parse_rule/1)
      |> generate_rule_book()

    Enum.map(comands, &parse_comands/1)
    |> Enum.filter(&(!check_order(rule_book, &1)))
    |> Enum.map(&generate_order(&1, rule_book))
    |> Enum.map(&Enum.reverse/1)
    |> Enum.map(&Enum.at(&1, div(Enum.count(&1) - 1, 2)))
    |> Enum.sum()
  end
end
