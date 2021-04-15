# Sizeable

<!-- MDOC !-->

[![Module Version](https://img.shields.io/hexpm/v/sizeable.svg)](https://hex.pm/packages/sizeable)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/sizeable/)
[![Total Download](https://img.shields.io/hexpm/dt/sizeable.svg)](https://hex.pm/packages/sizeable)
[![License](https://img.shields.io/hexpm/l/sizeable.svg)](https://github.com/arvidkahl/sizeable/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/arvidkahl/sizeable.svg)](https://github.com/arvidkahl/sizeable/commits/master)

An Elixir library to make file sizes human-readable.

## Installation

The package can be installed as:

1.  Add `:sizeable` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [
        {:sizeable, "~> 1.0"}
      ]
    end
    ```

2.  Ensure `sizeable` is started before your application if you're using Elixir 1.3 or lower:

    ```elixir
    def application do
      [
        applications: [:sizeable]
      ]
    end
    ```

## Usage

### Get file size for 1024 bytes

```elixir
Sizeable.filesize(1024)
"1 KB"
```

### Get bit-sized file size for 1024 bytes

```elixir
Sizeable.filesize(1024, bits: true)
"8 Kb"
```

### Get output format as list

```elixir
Sizeable.filesize(1024, output: :list)
[1, "KB"]
```

### Get output format as map

```elixir
Sizeable.filesize(1024, output: :map)
%{result: 1, unit: "KB"}
```

Read [Sizeable.filesize/2](https://hexdocs.pm/sizeable) for further usage details.

## Copyright and License

Copyright (c) 2016 Arvid Kahl

This software is licensed under [the MIT license](https://github.com/arvidkahl/sizeable/blob/master/LICENSE).
