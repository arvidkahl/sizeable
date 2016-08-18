# Reference tests from filesize.js

# 		this.kilobit  = 500;
# 		this.edgecase = 1023;
# 		this.kilobyte = 1024;
# 		this.neg      = -1024;
# 		this.byte     = 1;
# 		this.zero     = 0;
# 		this.invld    = "abc";
# 		this.huge     = 10e40;
# 		this.small    = 1/8;
# 		done();
# 	},
# 	base2: function (test) {
# 		test.expect(45);
#
# 		test.equal(filesize(this.kilobit),                             "500 B",    "Should be '500 B'");
# 		test.equal(filesize(this.kilobit, {round: 1}),                 "500 B",    "Should be '500 B'");
# 		test.equal(filesize(this.kilobit, {round: 1, spacer: ""}),     "500B",     "Should be '500B'");
# 		test.equal(filesize(this.kilobit, {unix: true}),               "500",      "Should be '500'");
# 		test.equal(filesize(this.kilobit, {round: 1, bits: true}),     "3.9 Kb",   "Should be '3.9 Kb'");
# 		test.equal(filesize(this.kilobit, {bits :true}),               "3.91 Kb",  "Should be '3.91 Kb'");
# 		test.equal(filesize(this.kilobit, {unix: true, bits: true}),   "3.9K",     "Should be '3.9K'");
# 		test.equal(filesize(this.kilobit, {bits :true, output: "array"})[0], 3.91,    "Should be '3.91'");
# 		test.equal(filesize(this.kilobit, {bits :true, output: "object"}).value, 3.91,"Should be '3.91'");
#
# 		test.equal(filesize(this.edgecase),                            "1023 B",   "Should be '1023 B'");
# 		test.equal(filesize(this.edgecase, {round: 1}),                "1023 B",   "Should be '1023 B'");
#
# 		test.equal(filesize(this.kilobyte),                            "1 KB",     "Should be '1 KB'");
# 		test.equal(filesize(this.kilobyte, {round: 1}),                "1 KB",     "Should be '1 KB'");
# 		test.equal(filesize(this.kilobyte, {round: 1, spacer: ""}),    "1KB",      "Should be '1KB'");
# 		test.equal(filesize(this.kilobyte, {unix: true}),              "1K",       "Should be '1K'");
# 		test.equal(filesize(this.kilobyte, {bits :true}),              "8 Kb",     "Should be '8 Kb'");
# 		test.equal(filesize(this.kilobyte, {round: 1, bits: true}),    "8 Kb",     "Should be '8 Kb'");
# 		test.equal(filesize(this.kilobyte, {unix: true, bits: true}),  "8K",       "Should be '8K'");
# 		test.equal(filesize(this.kilobyte, {exponent: 0}),             "1024 B",   "Should be '1024 B'");
# 		test.equal(filesize(this.kilobyte, {output: "exponent"}),      1,          "Should be '1'");
#
# 		test.equal(filesize(this.neg),                                 "-1 KB",    "Should be '-1 KB'");
# 		test.equal(filesize(this.neg, {round: 1}),                     "-1 KB",    "Should be '-1 KB'");
# 		test.equal(filesize(this.neg, {round: 1, spacer: ""}),         "-1KB",     "Should be '-1KB'");
# 		test.equal(filesize(this.neg, {unix: true}),                   "-1K",      "Should be '-1K'");
# 		test.equal(filesize(this.neg, {bits :true}),                   "-8 Kb",    "Should be '-8 Kb'");
# 		test.equal(filesize(this.neg, {round: 1, bits: true}),         "-8 Kb",    "Should be '-8 Kb'");
# 		test.equal(filesize(this.neg, {unix: true, bits: true}),       "-8K",      "Should be '-8K'");
#
# 		test.equal(filesize(this.byte),                                "1 B",      "Should be '1 B'");
# 		test.equal(filesize(this.byte, {round: 1}),                    "1 B",      "Should be '1 B'");
# 		test.equal(filesize(this.byte, {round: 1, spacer: ""}),        "1B",       "Should be '1B'");
# 		test.equal(filesize(this.byte, {unix: true}),                  "1",        "Should be '1'");
# 		test.equal(filesize(this.byte, {bits :true}),                  "8 b",      "Should be '8 b'");
# 		test.equal(filesize(this.byte, {round: 1, bits: true}),        "8 b",      "Should be '8 b'");
# 		test.equal(filesize(this.byte, {unix: true, bits: true}),      "8",        "Should be '8'");
#
# 		test.equal(filesize(this.zero),                                "0 B",      "Should be '0 B'");
# 		test.equal(filesize(this.zero, {round: 1}),                    "0 B",      "Should be '0 B'");
# 		test.equal(filesize(this.zero, {round: 1, spacer: ""}),        "0B",       "Should be '0B'");
# 		test.equal(filesize(this.zero, {unix: true}),                  "0",        "Should be '0'");
# 		test.equal(filesize(this.zero, {bits :true}),                  "0 b",      "Should be '0 b'");
# 		test.equal(filesize(this.zero, {round: 1, bits: true}),        "0 b",      "Should be '0 b'");
# 		test.equal(filesize(this.zero, {unix: true, bits: true}),      "0",        "Should be '0'");
#
# 		test.equal(filesize(this.huge),                                "82718061255302770 YB", "Should be '82718061255302770 YB'");
# 		test.equal(filesize(this.huge, {bits :true}),                  "661744490042422100 Yb", "Should be '661744490042422100 Yb'");
# 		test.equal(filesize(this.small),                               "0 B", "Should be '0 B'");
# 		test.equal(filesize(this.small, {bits :true}),                 "1 b", "Should be '1 b'");
#
# 		test.done();
# 	},
# 	base10: function (test) {
# 		test.expect(35);
#
# 		test.equal(filesize(this.kilobit, {base: 10}),                           "500 B",    "Should be '500 B'");
# 		test.equal(filesize(this.kilobit, {base: 10, round: 1}),                 "500 B",    "Should be '500 B'");
# 		test.equal(filesize(this.kilobit, {base: 10, round: 1, spacer: ""}),     "500B",     "Should be '500B'");
# 		test.equal(filesize(this.kilobit, {base: 10, unix: true}),               "500",      "Should be '500'");
# 		test.equal(filesize(this.kilobit, {base: 10, bits :true}),               "4 kb",     "Should be '4 kb'");
# 		test.equal(filesize(this.kilobit, {base: 10, round: 1, bits: true}),     "4 kb",     "Should be '4 kb'");
# 		test.equal(filesize(this.kilobit, {base: 10, unix: true, bits: true}),   "4k",       "Should be '4k'");
#
# 		test.equal(filesize(this.kilobyte, {base: 10}),                          "1.02 kB",  "Should be '1.02 kB'");
# 		test.equal(filesize(this.kilobyte, {base: 10, round: 1}),                "1 kB",     "Should be '1 kB'");
# 		test.equal(filesize(this.kilobyte, {base: 10, round: 1, spacer: ""}),    "1kB",      "Should be '1kB'");
# 		test.equal(filesize(this.kilobyte, {base: 10, unix: true}),              "1k",       "Should be '1k'");
# 		test.equal(filesize(this.kilobyte, {base: 10, bits :true}),              "8.19 kb",  "Should be '8.19 kb'");
# 		test.equal(filesize(this.kilobyte, {base: 10, round: 1, bits: true}),    "8.2 kb",   "Should be '8.2 kb'");
# 		test.equal(filesize(this.kilobyte, {base: 10, unix: true, bits: true}),  "8.2k",     "Should be '8.2k'");
#
# 		test.equal(filesize(this.neg, {base: 10}),                               "-1.02 kB", "Should be '-1.02 kB'");
# 		test.equal(filesize(this.neg, {base: 10, round: 1}),                     "-1 kB",    "Should be '-1 kB'");
# 		test.equal(filesize(this.neg, {base: 10, round: 1, spacer: ""}),         "-1kB",     "Should be '-1kB'");
# 		test.equal(filesize(this.neg, {base: 10, unix: true}),                   "-1k",      "Should be '-1k'");
# 		test.equal(filesize(this.neg, {base: 10, bits :true}),                   "-8.19 kb", "Should be '-8.19 kb'");
# 		test.equal(filesize(this.neg, {base: 10, round: 1, bits: true}),         "-8.2 kb",  "Should be '-8.2 kb'");
# 		test.equal(filesize(this.neg, {base: 10, unix: true, bits: true}),       "-8.2k",    "Should be '-8.2k'");
#
# 		test.equal(filesize(this.byte, {base: 10}),                              "1 B",      "Should be '1 B'");
# 		test.equal(filesize(this.byte, {base: 10, round: 1}),                    "1 B",      "Should be '1 B'");
# 		test.equal(filesize(this.byte, {base: 10, round: 1, spacer: ""}),        "1B",       "Should be '1B'");
# 		test.equal(filesize(this.byte, {base: 10, unix: true}),                  "1",        "Should be '1'");
# 		test.equal(filesize(this.byte, {base: 10, bits :true}),                  "8 b",      "Should be '8 b'");
# 		test.equal(filesize(this.byte, {base: 10, round: 1, bits: true}),        "8 b",      "Should be '8 b'");
# 		test.equal(filesize(this.byte, {base: 10, unix: true, bits: true}),      "8",        "Should be '8'");
#
# 		test.equal(filesize(this.zero, {base: 10}),                              "0 B",      "Should be '0 B'");
# 		test.equal(filesize(this.zero, {base: 10, round: 1}),                    "0 B",      "Should be '0 B'");
# 		test.equal(filesize(this.zero, {base: 10, round: 1, spacer: ""}),        "0B",       "Should be '0B'");
# 		test.equal(filesize(this.zero, {base: 10, unix: true}),                  "0",        "Should be '0'");
# 		test.equal(filesize(this.zero, {base: 10, bits :true}),                  "0 b",      "Should be '0 b'");
# 		test.equal(filesize(this.zero, {base: 10, round: 1, bits: true}),        "0 b",      "Should be '0 b'");
# 		test.equal(filesize(this.zero, {base: 10, unix: true, bits: true}),      "0",        "Should be '0'");

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
    assert Sizeable.filesize(@kilobit, %{bits: true}) == "3.91 Kb"
  end

  test "500 B bits base10" do
    assert Sizeable.filesize(@kilobit, %{bits: true, base: 10}) == "4 Kb"
  end

  test "500 B bits base10 round" do
    assert Sizeable.filesize(@kilobit, %{bits: true, base: 10, round: 1}) == "4 Kb"
  end

  test "500 B bits round" do
    assert Sizeable.filesize(@kilobit, %{bits: true, round: 1}) == "3.9 Kb"
  end

  # Tests for Kilobyte values
  test "1 KB" do
    assert Sizeable.filesize(@kilobyte) == "1 KB"
  end

  test "1 KB round" do
    assert Sizeable.filesize(@kilobyte, %{round: 1}) == "1 KB"
  end

  test "1 KB round spacer" do
    assert Sizeable.filesize(@kilobyte, %{round: 1, spacer: ""}) == "1KB"
  end

  test "1 KB bits" do
    assert Sizeable.filesize(@kilobyte, %{bits: true}) == "8 Kb"
  end

  test "1 KB bits round" do
    assert Sizeable.filesize(@kilobyte, %{bits: true, round: 1}) == "8 Kb"
  end

  # Tests for negative values
  test "neg" do
    assert Sizeable.filesize(@neg) == "-1 KB"
  end

  test "neg round" do
    assert Sizeable.filesize(@neg, %{round: 1}) == "-1 KB"
  end

  test "neg round spacer" do
    assert Sizeable.filesize(@neg, %{round: 1, spacer: ""}) == "-1KB"
  end

  test "neg bits" do
    assert Sizeable.filesize(@neg, %{bits: true}) == "-8 Kb"
  end

  test "neg round bits" do
    assert Sizeable.filesize(@neg, %{bits: true, round: 1}) == "-8 Kb"
  end


  # Tests for 0
  test "zero round" do
    assert Sizeable.filesize(@zero, %{round: 1}) == "0 B"
  end

  test "zero round spacer" do
    assert Sizeable.filesize(@zero, %{round: 1, spacer: ""}) == "0B"
  end

  test "zero bits" do
    assert Sizeable.filesize(@zero, %{bits: true}) == "0 b"
  end
  test "zero bits round" do
    assert Sizeable.filesize(@zero, %{bits: true, round: 1}) == "0 b"
  end

  # Tests for the 1023 edge case
  test "edgecase" do
    assert Sizeable.filesize(@edgecase) == "1023 B"
  end

  test "edgecase round" do
    assert Sizeable.filesize(@edgecase, %{round: 1}) == "1023 B"
  end

  # Tests for byte values
  test "byte" do
    assert Sizeable.filesize(@byte) == "1 B"
  end

  test "byte round" do
    assert Sizeable.filesize(@byte, %{round: 1}) == "1 B"
  end
  test "byte round spacer" do
    assert Sizeable.filesize(@byte, %{round: 1, spacer: ""}) == "1B"
  end

  test "byte bits" do
    assert Sizeable.filesize(@byte, %{bits: true}) == "8 b"
  end

  test "byte bits round" do
    assert Sizeable.filesize(@byte, %{bits: true, round: 1}) == "8 b"
  end

end
