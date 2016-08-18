# Sizeable ![Build status](https://travis-ci.org/arvidkahl/sizeable.svg)

An Elixir library to make file sizes human-readable.

## Installation

The package can be installed as:

  1. Add `sizeable` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:sizeable, "~> 0.1.3"}]
    end
    ```

  2. Ensure `sizeable` is started before your application:

    ```elixir
    def application do
      [applications: [:sizeable]]
    end
    ```

## Usage

### `Sizeable.filesize(value, options \\ %{})`

Returns a human-readable string for the given numeric value.

#### Arguments:

- `value` (Integer/Float/String) representing the filesize to be converted.
- `options` (Struct) representing the options to determine base, rounding and units.

#### Options

- `bits`: `true` if the result should be in bits, `false` if in bytes. Defaults to `false`.
- `spacer`: the string that should be between the number and the unit. Defaults to `" "`.
- `round`: the precision that the number should be rounded down to. Defaults to `2`.
- `base`: the base for exponent calculation. `2` for binary-based numbers, any other Integer can be used. Defaults to `2`.

#### Example - Get file size for 1024 bytes

    Sizeable.filesize(1024)
    "1 KB"

#### Example - Get bit-sized file size for 1024 bytes

    Sizeable.filesize(1024, %{bits:true})
    "8 Kb"
