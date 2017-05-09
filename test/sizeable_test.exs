defmodule SizeableTest do
  use ExUnit.Case
  require Sizeable

  doctest Sizeable

  @kilobit 500
  @kilobit_float 500.0
  @kilobit_string "500.0"
  @kilobyte 1024
  @neg -1024
  @zero 0
  @byte 1
  @edgecase 1023

  @fail_value_string "abc"
  @fail_value_atom :abc
  @fail_options {:bits, true}

  # Test for erroneous values
  test "fail" do
    assert_raise RuntimeError, "Value is not a Number", fn ->
      Sizeable.filesize(@fail_value_string)
    end
  end

  test "fail atom" do
    assert_raise RuntimeError, "Invalid Value", fn ->
      Sizeable.filesize(@fail_value_atom)
    end
  end

  test "fail options" do
    assert_raise RuntimeError, "Invalid Options Argument", fn ->
      Sizeable.filesize(@kilobyte, @fail_options)
    end
  end

  # Tests for kilobit values
  test "500 B" do
    assert Sizeable.filesize(@kilobit) == "500 B"
  end

  test "500 B float" do
    assert Sizeable.filesize(@kilobit_float) == "500 B"
  end

  test "500 B string" do
    assert Sizeable.filesize(@kilobit_string) == "500 B"
  end

  test "500 B bits" do
    assert Sizeable.filesize(@kilobit, bits: true) == "3.91 Kb"
  end

  test "500 B bits base10" do
    assert Sizeable.filesize(@kilobit, bits: true, base: 10) == "4 Kb"
  end

  test "500 B bits base10 round" do
    assert Sizeable.filesize(@kilobit, bits: true, base: 10, round: 1) == "4 Kb"
  end

  test "500 B bits round" do
    assert Sizeable.filesize(@kilobit, bits: true, round: 1) == "3.9 Kb"
  end

  # Tests for Kilobyte values
  test "1 KB" do
    assert Sizeable.filesize(@kilobyte) == "1 KB"
  end

  test "1 KB round" do
    assert Sizeable.filesize(@kilobyte, round: 1) == "1 KB"
  end

  test "1 KB round spacer" do
    assert Sizeable.filesize(@kilobyte, round: 1, spacer: "") == "1KB"
  end

  test "1 KB bits" do
    assert Sizeable.filesize(@kilobyte, bits: true) == "8 Kb"
  end

  test "1 KB bits round" do
    assert Sizeable.filesize(@kilobyte, bits: true, round: 1) == "8 Kb"
  end

  # Tests for negative values
  test "neg" do
    assert Sizeable.filesize(@neg) == "-1 KB"
  end

  test "neg round" do
    assert Sizeable.filesize(@neg, round: 1) == "-1 KB"
  end

  test "neg round spacer" do
    assert Sizeable.filesize(@neg, round: 1, spacer: "") == "-1KB"
  end

  test "neg bits" do
    assert Sizeable.filesize(@neg, bits: true) == "-8 Kb"
  end

  test "neg round bits" do
    assert Sizeable.filesize(@neg, bits: true, round: 1) == "-8 Kb"
  end

  # Tests for 0
  test "zero round" do
    assert Sizeable.filesize(@zero, round: 1) == "0 B"
  end

  test "zero round spacer" do
    assert Sizeable.filesize(@zero, round: 1, spacer: "") == "0B"
  end

  test "zero bits" do
    assert Sizeable.filesize(@zero, bits: true) == "0 b"
  end

  test "zero bits round" do
    assert Sizeable.filesize(@zero, bits: true, round: 1) == "0 b"
  end

  # Tests for the 1023 edge case
  test "edgecase" do
    assert Sizeable.filesize(@edgecase) == "1023 B"
  end

  test "edgecase round" do
    assert Sizeable.filesize(@edgecase, [round: 1]) == "1023 B"
  end

  # Tests for byte values
  test "byte" do
    assert Sizeable.filesize(@byte) == "1 B"
  end

  test "byte round" do
    assert Sizeable.filesize(@byte, round: 1) == "1 B"
  end

  test "byte round spacer" do
    assert Sizeable.filesize(@byte, round: 1, spacer: "") == "1B"
  end

  test "byte bits" do
    assert Sizeable.filesize(@byte, bits: true) == "8 b"
  end

  test "byte bits round" do
    assert Sizeable.filesize(@byte, bits: true, round: 1) == "8 b"
  end

  # Test for output formats
  test "ouput string" do
    assert Sizeable.filesize(@kilobyte, output: :string) == "1 KB"
    assert Sizeable.filesize(@zero, ouput: :string) == "0 B"
  end

  test "ouput list" do
    assert Sizeable.filesize(@kilobyte, output: :list) == [1, "KB"]
    assert Sizeable.filesize(@zero, output: :list) == [0, "B"]
  end

  test "output map" do
    assert Sizeable.filesize(@kilobyte, output: :map) == %{result: 1, unit: "KB"}
    assert Sizeable.filesize(@zero, output: :map) == %{result: 0, unit: "B"}
  end

  test "ouput invalid" do
    assert_raise RuntimeError, "Invalid `array` output value, possible options are :string, :list, :map", fn ->
      Sizeable.filesize(@kilobyte, output: :array)
    end
  end
end
