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
./runner.py "elk %s" -q
./runner.py "lcc %s -o %o" "%o" -q
```

## Test semantics

- Tests under `./tests/1_syntax/` are expected to fail to assemble such as
  invalid syntax.
- Tests named like `*_crash.asm` are expected to crash at runtime usually from
  ACV.
- Tests must emit "TEST_PASSED" to pass.
