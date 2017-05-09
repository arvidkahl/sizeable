# Sizeable ![Build status](https://travis-ci.org/arvidkahl/sizeable.svg)

An Elixir library to make file sizes human-readable.

## Installation

The package can be installed as:

  1. Add `sizeable` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:sizeable, "~> 1.0"}]
  end
  ```

  2. Ensure `sizeable` is started before your application:

  ```elixir
  def application do
    [applications: [:sizeable]]
  end
  ```

## Usage

### `Sizeable.filesize(value, options \\ [])`

Returns a human-readable string for the given numeric value.

#### Arguments:

- `value` (Integer/Float/String) representing the filesize to be converted.
- `options` (Struct) representing the options to determine base, rounding and units.

#### Options:

- `bits`: `true` if the result should be in bits, `false` if in bytes. Defaults to `false`.
- `spacer`: the string that should be between the number and the unit. Defaults to `" "`.
- `round`: the precision that the number should be rounded down to. Defaults to `2`.
- `base`: the base for exponent calculation. `2` for binary-based numbers, any other Integer can be used. Defaults to `2`.
- `output`: the ouput format to be used, possible options are :string, :list, :map. Defaults to :string.

#### Example - Get file size for 1024 bytes

```elixir
Sizeable.filesize(1024)
"1 KB"
```

#### Example - Get bit-sized file size for 1024 bytes

```elixir
Sizeable.filesize(1024, bits: true)
"8 Kb"
```

#### Example - Get output format as list

```elixir
Sizeable.filesize(1024, output: :list)
[1, "KB"]
```

#### Example - Get output format as map

```elixir
Sizeable.filesize(1024, output: :map)
%{result: 1, unit: "KB"}
```
