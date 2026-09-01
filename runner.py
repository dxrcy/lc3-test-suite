#!/usr/bin/env python3
"""
LC-3 Test Suite Runner

  ./runner.py [-q] CMD
  ./runner.py [-q] ASSEMBLE_CMD EMULATE_CMD

  %s = source file
  %o = output file
"""

import glob
import os
import subprocess
import sys
import tempfile
from typing import Literal


def format_command(command: str, source_file: str, object_file: str) -> str:
    return command.replace("%s", source_file).replace("%o", object_file)


def run_command(command: str) -> tuple[bool, int, str]:
    try:
        r = subprocess.run(
            command, shell=True, capture_output=True, text=True, timeout=30
        )
        return False, r.returncode, r.stdout + r.stderr
    except Exception:
        return True, 1, ""


def run_test(
    filepath: str, assemble_cmd: str, emulate_cmd: str | None
) -> Literal["pass", "fail", "crash"]:

    two_step = emulate_cmd is not None

    fd, obj = tempfile.mkstemp(suffix=".obj")
    os.close(fd)

    assemble_failed = False

    if two_step:
        cmd = format_command(assemble_cmd, filepath, obj)
        crashed, return_code, _ = run_command(cmd)

        assemble_failed = crashed or return_code != 0

        cmd = format_command(emulate_cmd, filepath, obj)
    else:
        cmd = format_command(assemble_cmd, filepath, obj)

    crashed, return_code, output = run_command(cmd)
    failed = (
        crashed
        or return_code != 0
        or "error" in output.lower()
        or "exception" in output.lower()
    )

    if os.path.exists(obj):
        os.remove(obj)

    expect_asm_fail = "/1_syntax/" in filepath
    expect_parse_only = "/0_parsing/" in filepath
    expect_crash = filepath.endswith("_crash.asm")
    has_pass = "TEST_PASSED" in output
    has_fail = "TEST_FAILED" in output

    if has_fail:
        return "fail"

    if expect_parse_only and not (assemble_failed or (not two_step and failed)):
        return "pass"
    if expect_asm_fail and (assemble_failed or (not two_step and failed)):
        return "pass"
    if expect_crash and failed and not assemble_failed:
        return "pass"
    if has_pass:
        return "pass"

    if crashed:
        return "crash"

    return "fail"


def parse_args(args: list[str]) -> tuple[str, str | None, bool]:
    quiet = "-q" in args
    if quiet:
        args.remove("-q")

    if not args:
        print(__doc__.strip())
        sys.exit(1)

    if len(args) == 1:
        return args[0], None, quiet
    else:
        return args[0], args[1] or None, quiet


COLORS = {"pass": "\033[32m", "fail": "\033[31m", "crash": "\033[33m"}


def main():
    assemble_cmd, emulate_cmd, quiet = parse_args(sys.argv[1:])

    files = sorted(glob.glob("tests/**/*.asm", recursive=True))

    results = {"pass": 0, "fail": 0, "crash": 0}

    for file in files:
        if not os.path.isfile(file):
            continue

        result = run_test(file, assemble_cmd, emulate_cmd)
        results[result] += 1

        if quiet and result == "pass":
            continue

        print(f"  {file:<50} {COLORS[result]}{result.upper()}\033[0m")

    total = sum([results[k] for k in results])
    print(f"\n{"".join([f"{results[k]} {k}ed, " for k in results])}{total} total")
    sys.exit(1 if results["fail"] > 0 else 0)


if __name__ == "__main__":
    main()
