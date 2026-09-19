# LC-3 Test Suite

A test suite for the LC-3 ISA (3rd edition), designed to verify assemblers and
emulators.

## Runner

`runner.py` takes one or two commands and runs all `tests/**/*.asm` files:

```sh
./runner.py [-q] [-e] [-v] [-t N] [-s N] CMD
./runner.py [-q] [-e] [-v] [-t N] [-s N] ASSEMBLE_CMD EMULATE_CMD
```

The `-q` flag enables quiet mode which only outputs failures.
The `-e` flag enables extension mode which runs extension tests.
The `-v` flag enables verbose mode which prints each test output.
The `-t` flag sets the timeout in seconds for each test (default: 30).
The `-s` flag sets the number of failures to suppress/allow without exiting 1 (default: 0).

| Placeholder | Expands to                                           |
| ----------- | ---------------------------------------------------- |
| `%s`        | Source `.asm` file path                              |
| `%o`        | Output file path (absolute, do not prefix with `./`) |

### Examples

```sh
./runner.py "elk %s --assemble --output %o" "elk %o --emulate" -e
./runner.py "lace compile %s %o" "lace run %o" -q
./runner.py "lcc %s -o %o" "%o" -q -s 15 -t 20
./runner.py "elk %s" -q -t 5
# test an assembler/parser without an emulator
./runner.py "laser -a %s" "echo TEST_PASSED && [[ '%s' == *_crash.asm ]] && return 1" -q
```

## Test semantics

- Tests under `./tests/0_parsing/` only need to parse without crashing.
- Tests under `./tests/1_syntax/` are expected to fail to assemble such as
  invalid syntax.
- Tests named with `_crash` are expected to crash at runtime usually from
  ACV.
- Tests named with `_extension` are only ran if `-e` flag is passed.
- Tests named with `_standard` are not ran if `-e` flag is passed.
- Tests must emit "TEST_PASSED" to pass.

## GitHub Actions

This repo can be used as a GitHub Action to test your LC-3 toolchain in CI.
For example, for [ELK](https://github.com/dxrcy/elk):

```yaml
steps:
    # checkout, build, etc
    - uses: actions/checkout@v7
    - uses: mlugg/setup-zig@v2
      with:
          version: 0.16.0
    - name: Build binary
      run: zig build

    # run test suite on ./zig-out/bin/elk
    - uses: twhlynch/lc3-test-suite@v2
      with:
          assemble: "$GITHUB_WORKSPACE/zig-out/bin/elk %s --assemble --output %o"
          emulate: "$GITHUB_WORKSPACE/zig-out/bin/elk %o --emulate"
          extensions: "true"
          timeout: "30"
          suppress: "0"
```
