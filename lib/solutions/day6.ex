defmodule Aoc2024.Day6 do
  @splitter "\n"
  defp read_input(path) do
    File.read!(path)
    |> String.split(@splitter, trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  defp make_path({{x, y}, {:ok, "#"}}, {x_vel, y_vel}, grid, steps, part, acc) do
    make_path(
      {{x - x_vel, y - y_vel}, Map.fetch(grid, {x - x_vel, y - y_vel})},
      {y_vel, -x_vel},
      grid,
      steps,
      part,
      acc
    )
  end

  defp make_path({{x, y}, {:ok, el}}, {x_vel, y_vel}, grid, steps, part, acc) do
    val = Map.get(steps, {x, y})

    if val == nil or {x_vel, y_vel} not in val do
      make_path(
        {{x + x_vel, y + y_vel}, Map.fetch(grid, {x + x_vel, y + y_vel})},
        {x_vel, y_vel},
        Map.update!(grid, {x, y}, fn _ ->
          if el != "^" do
            "x"
          else
            el
          end
        end),
        Map.update(steps, {x, y}, [{x_vel, y_vel}], fn list -> [{x_vel, y_vel} | list] end),
        part,
        if part == :part2 and
             el == "." and
             make_path(
               {{x, y}, {:ok, "#"}},
               {x_vel, y_vel},
               Map.update!(grid, {x, y}, fn _ -> "#" end),
               steps,
               :test,
               acc
             ) == :loop do
          [{x, y} | acc]
        else
          acc
        end
      )
    else
      :loop
    end
  end

  defp make_path({_, :error}, _, grid, _, part, acc) do
    if part == :part2 do
      acc
    else
      grid
    end
  end

  def day6_part1(path) do
    input = read_input(path)

    grid =
      Enum.zip(0..(Enum.count(input) - 1), input)
      |> Enum.flat_map(fn {x, row} ->
        Enum.zip(0..(Enum.count(row) - 1), row)
        |> Enum.map(fn {y, el} -> {{x, y}, el} end)
      end)
      |> Enum.into(%{})

    {key, _} = Enum.find(grid, fn {_, val} -> val == "^" end)

    (make_path({key, {:ok, "^"}}, {-1, 0}, grid, %{}, :part1, [])
     |> Enum.count(fn {_, el} -> el == "x" end)) + 1
  end

  def day6_part2(path) do
    input = read_input(path)

    grid =
      Enum.zip(0..(Enum.count(input) - 1), input)
      |> Enum.flat_map(fn {x, row} ->
        Enum.zip(0..(Enum.count(row) - 1), row)
        |> Enum.map(fn {y, el} -> {{x, y}, el} end)
      end)
      |> Enum.into(%{})

    {key, _} = Enum.find(grid, fn {_, val} -> val == "^" end)

    make_path({key, {:ok, "^"}}, {-1, 0}, grid, %{}, :part2, [])
    |> Enum.uniq()
    |> Enum.count()
  end
end
