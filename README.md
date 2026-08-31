# LC-3 Test Suite

A test suite for the LC-3 ISA (3rd edition), designed to verify assemblers and
emulators.

## Runner

`runner.py` takes one or two commands and runs all `tests/**/*.asm` files:

```sh
./runner.py [-q] CMD
./runner.py [-q] ASSEMBLE_CMD EMULATE_CMD
```

| Placeholder | Expands to                                           |
| ----------- | ---------------------------------------------------- |
| `%s`        | Source `.asm` file path                              |
| `%o`        | Output file path (absolute, do not prefix with `./`) |

### Examples

```sh
./runner.py "elk %s --assemble --output %o" "elk %o --emulate"
./runner.py "lace compile %s %o" "lace run %o" -q
./runner.py "lcc %s -o %o" "%o" -q
./runner.py "elk %s" -q
```

## Test semantics

- Tests under `./tests/1_syntax/` are expected to fail to assemble such as
  invalid syntax.
- Tests named like `*_crash.asm` are expected to crash at runtime usually from
  ACV.
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
    - uses: twhlynch/lc3-test-suite@v1
      with:
          assemble: "./zig-out/bin/elk %s --assemble --output %o"
          emulate: "./zig-out/bin/elk %o --emulate"
```
