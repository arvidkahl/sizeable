defmodule Sizeable do
  @moduledoc """
  A library to make file sizes human-readable
  """

  require Logger

  @bits ~w(b Kb Mb Gb Tb Pb Eb Zb Yb)
  @bytes ~w(B KB MB GB TB PB EB ZB YB)

  @doc """
  see `filesize(value, options)`
  """
  def filesize(value) do
    filesize(value, [])
  end

  def filesize(value, options) when is_map(options) do
    Logger.warn("Using maps for options is deprecated. Please use Keyword Lists.")
    filesize(value, Map.to_list(options))
  end

  def filesize(value, options) when is_bitstring(value) do
    case Integer.parse(value) do
      {parsed, _rem} -> filesize(parsed, options)
      :error -> raise "Value is not a Number"
    end
  end

  def filesize(value, options) when is_integer(value) do
    {parsed, _rem} = value |> Integer.to_string() |> Float.parse()
    filesize(parsed, options)
  end

  def filesize(0.0, options) do
    spacer = Keyword.get(options, :spacer, " ")
    bits = Keyword.get(options, :bits, false)
    output = Keyword.get(options, :output, :string)

    {:ok, unit} = case bits do
      true -> Enum.fetch(@bits, 0)
      false -> Enum.fetch(@bytes, 0)
    end

    filesize_output(output, 0, unit, spacer)
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
  - `output`: the ouput format to be used, possible options are :string, :list, :map. Defaults to :string.

  ## Example - Get bit-sized file size for 1024 byte

    Sizeable.filesize(1024, bits: true)
    "8 Kb"
  """
  def filesize(value, options) when (is_float(value) and is_list(options)) do
    bits = Keyword.get(options, :bits, false)
    base = Keyword.get(options, :base, 2)
    spacer = Keyword.get(options, :spacer, " ")
    round = Keyword.get(options, :round, 2)
    output = Keyword.get(options, :output, :string)

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
      round result
    else
      Float.round(result, round)
    end

    {:ok, unit} = case bits do
      true -> Enum.fetch(@bits, exponent)
      false -> Enum.fetch(@bytes, exponent)
    end

    result = case neg do
      true -> result * -1
      false -> result
    end

    filesize_output(output, result, unit, spacer)
  end

  def filesize(_value, options) when is_list(options) do
    raise "Invalid Value"
  end

  def filesize(_value, _options) do
    raise "Invalid Options Argument"
  end

  def filesize_output(output, result, unit, spacer) do
    case output do
      :string -> Enum.join([result, unit], spacer)
      :list -> [result, unit]
      :map -> %{result: result, unit: unit}
      _ -> raise "Invalid `#{output}` output value, possible options are :string, :list, :map"
    end
  end
end
