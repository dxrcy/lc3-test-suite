#!/usr/bin/env python3
"""
LC-3 Test Suite Runner

  ./runner.py [-q] [-e] [-v] [-t N] [-s N] CMD
  ./runner.py [-q] [-e] [-v] [-t N] [-s N] ASSEMBLE_CMD EMULATE_CMD

  -q = quiet mode, only output failures
  -e = extension mode, run extension tests
  -v = verbose mode, print output of each test as it goes
  -t = timeout for test runtime
  -s = suppress N failures only exit 1 when over

  %s = source file
  %o = output file
"""

from dataclasses import dataclass
import glob
import os
import re
import subprocess
import sys
import tempfile
from typing import Literal


@dataclass
class Config:
    assemble_cmd: str
    emulate_cmd: str | None
    quiet: bool
    extensions: bool
    timeout: int
    suppress: int
    verbose: bool


def format_command(command: str, source_file: str, object_file: str) -> str:
    return command.replace("%s", source_file).replace("%o", object_file)


def run_command(command: str, config: Config) -> tuple[bool, int, str]:
    try:
        r = subprocess.run(
            command, shell=True, capture_output=True, text=True, timeout=config.timeout
        )
        output = r.stdout + r.stderr

        if config.verbose:
            print(output, end="" if output.endswith("\n") else "\n")

        return False, r.returncode, output
    except Exception:
        return True, 1, ""


def run_test(filepath: str, config: Config) -> Literal["pass", "fail", "crash"] | None:

    basename = os.path.basename(filepath)

    is_extension = "_extension" in basename
    is_standard = "_standard" in basename
    if not config.extensions and is_extension:
        return None
    if config.extensions and is_standard:
        return None

    two_step = config.emulate_cmd is not None

    fd, obj = tempfile.mkstemp(suffix=".obj")
    os.close(fd)

    assemble_failed = False

    if two_step:
        cmd = format_command(config.assemble_cmd, filepath, obj)
        crashed, return_code, _ = run_command(cmd, config)

        assemble_failed = crashed or return_code != 0

        cmd = format_command(config.emulate_cmd, filepath, obj)
    else:
        cmd = format_command(config.assemble_cmd, filepath, obj)

    crashed, return_code, output = run_command(cmd, config)

    if os.path.exists(obj):
        os.remove(obj)

    output_lower = output.lower()
    failed = (
        crashed
        or return_code != 0
        or re.search(r"$error", output_lower)
        or "exception" in output_lower
    )

    expect_parse_only = "/0_parsing/" in filepath
    expect_asm_fail = "/1_syntax/" in filepath
    expect_crash = "_crash" in basename
    has_pass = "TEST_PASSED" in output
    has_fail = "TEST_FAILED" in output

    if has_fail:
        return "fail"

    if expect_parse_only and (not assemble_failed or (not two_step and not failed)):
        return "pass"
    if expect_asm_fail:
        if assemble_failed or (not two_step and failed):
            return "pass"
        return "fail"
    if expect_crash:
        if failed and not assemble_failed:
            return "pass"
        return "fail"
    if has_pass and not (assemble_failed or (not two_step and failed)):
        return "pass"

    if crashed:
        return "crash"

    return "fail"


def arg_with_value(args: list[str], flag: str) -> int | None:
    if flag in args:
        index = args.index(flag)

        if index + 1 < len(args):
            value = args[index + 1]
            args.pop(index + 1)
            args.remove(flag)

            try:
                return int(value)
            except ValueError:
                sys.exit(f"Error: {flag} requires an integer value, got '{value}'")

        sys.exit(f"Error: {flag} requires a value")

    return None


def arg_flag(args: list[str], flag: str) -> bool:
    if flag in args:
        args.remove(flag)
        return True

    return False


def parse_args(
    args: list[str],
) -> Config:
    quiet = arg_flag(args, "-q")
    timeout = arg_with_value(args, "-t")
    suppress = arg_with_value(args, "-s")
    extensions = arg_flag(args, "-e")
    verbose = arg_flag(args, "-v")

    if not args:
        print(__doc__.strip())
        sys.exit(1)

    return Config(
        assemble_cmd=args[0],
        emulate_cmd=args[1] or None if len(args) > 1 else None,
        quiet=quiet,
        extensions=extensions,
        timeout=timeout if timeout is not None else 30,
        suppress=suppress if suppress is not None else 0,
        verbose=verbose,
    )


COLORS = {"pass": "\033[32m", "fail": "\033[31m", "crash": "\033[33m"}


def main():
    config = parse_args(sys.argv[1:])

    files = sorted(glob.glob("tests/**/*.asm", recursive=True))

    results = {"pass": 0, "fail": 0, "crash": 0}

    try:
        for file in files:
            if not os.path.isfile(file):
                continue

            result = run_test(file, config)
            if result is None:
                continue

            results[result] += 1

            if config.quiet and result == "pass":
                continue

            print(f"  {file:<50} {COLORS[result]}{result.upper()}\033[0m")

    except KeyboardInterrupt:
        print(f"\nKilled at {sum([results[k] for k in results])}/{len(files)}")

    total = sum([results[k] for k in results])
    print(f"\n{"".join([f"{results[k]} {k}ed, " for k in results])}{total} total")
    sys.exit(1 if results["fail"] > config.suppress else 0)


if __name__ == "__main__":
    main()
