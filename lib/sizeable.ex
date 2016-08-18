defmodule Sizeable do

  @moduledoc """
  A library to make file sizes human-readable
  """

  @bits ["b", "Kb", "Mb", "Gb", "Tb", "Pb", "Eb", "Zb", "Yb"]
	@bytes ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"]

  @doc """
  see `filesize(value, options)`
  """
  def filesize(value) do
    filesize(value, %{})
  end

  def filesize(value,options) when is_bitstring(value) do
    case value |> Integer.parse() do
      {parsed, _rem} -> filesize(parsed, options)
      :error -> raise "Value is not a Number"
    end
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

  @doc """
  Returns a human-readable string for the given numeric value.

  ## Arguments:

  - `value` (Integer/Float/String) representing the filesize to be converted.
  - `options` (Struct) representing the options to determine base, rounding and units.

  ## Options

  - `bits`: `true` if the result should be in bits, `false` if in bytes. Defaults to `false`.
  - `spacer`: the string that should be between the number and the unit. Defaults to `" "`.
  - `round`: the precision that the number should be rounded down to. Defaults to `2`.
  - `base`: the base for exponent calculation. `2` for binary-based numbers, any other Integer can be used. Defaults to `2`.

  ## Example - Get bit-sized file size for 1024 byte

      Sizeable.filesize(1024, %{bits:true})
      "8 Kb"

  """

  def filesize(value, options) when (is_float(value) and is_map(options)) do
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
      result = round result
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

  def filesize(_value, options) when is_map(options) do
    raise "Invalid Value"
  end

  def filesize(_value, _options) do
    raise "Invalid Options Argument"
  end


end
