defmodule Sizeable do

  @moduledoc """
  A library to make file sizes human-readable
  """

  @bits ["b", "Kb", "Mb", "Gb", "Tb", "Pb", "Eb", "Zb", "Yb"]
	@bytes ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"]

  def filesize(value) do
    filesize(value, %{})
  end

  def filesize(value,options) when is_bitstring(value) do
    {parsed, _rem} = value |> Integer.parse()
    filesize(parsed, options)
  end

  def filesize(value, options) when is_integer(value) do
    {parsed, _rem} = value |> Integer.to_string() |> Float.parse()
    filesize(parsed, options)
  end

  def filesize(0.0, options) do
    spacer = Map.get(options, :spacer, " ")
    bits = Map.get(options, :bits, false)

    {:ok, unit} = case bits do
      true -> Enum.fetch(@bits, 0)
      false -> Enum.fetch(@bytes, 0)
    end
    Enum.join([0,unit], spacer)
  end

  def filesize(value, options) do
    bits = Map.get(options, :bits, false)
    base = Map.get(options, :base, 2)
    spacer = Map.get(options, :spacer, " ")
    round = Map.get(options, :round, 2)

    ceil = if base > 2 do 1000 else 1024 end
    neg = value < 0

    value = case neg do
      true -> -value
      false -> value
    end

    value = if bits do 8 * value else value end

    {exponent, _rem} = :math.log(value)/:math.log(ceil)
      |> Float.floor
      |> Float.to_string
      |> Integer.parse

    result = Float.round(value / :math.pow(ceil, exponent), base)

    result = if Float.floor(result) == result do
      {result, _rem} = result
        |> Float.to_string()
        |> Integer.parse()
      result
    else
      result
        |> Float.round(round)
    end

    {:ok, unit} = case bits do
      true -> Enum.fetch(@bits, exponent)
      false -> Enum.fetch(@bytes, exponent)
    end

    case neg do
      true ->
        "-" <> Enum.join([result,unit], spacer)
      false ->
        Enum.join([result,unit], spacer)
    end
  end

end