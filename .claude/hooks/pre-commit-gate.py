#!/usr/bin/env python3
"""PreToolUse hook: gate `git commit` on skill-integrity checks.

Fires before every Bash tool call. If the bash command is a `git commit`
(or `git commit-tree` etc., which we don't gate), runs
scripts/check-skill-integrity.py. Exits non-zero to block the commit
when integrity findings are present.

Why a hook (vs. trusting the /commit skill): the demo on the
"Hooks: deterministic enforcement" slide claims `check-skill-integrity.py`
blocks at commit time. A skill is opt-in; a hook is unconditional. This
is what makes the slide claim true regardless of how the commit is run.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path


def _is_git_commit(command: str) -> bool:
    # Match `git commit ...` or `git -c x=y commit ...` but NOT
    # `git commit-tree` / `git --help commit`. Crude but adequate.
    return bool(re.search(r"\bgit\b(?:\s+-c\s+\S+)*\s+commit\b(?!-)", command))


def main() -> int:
    try:
        payload = json.load(sys.stdin)
    except json.JSONDecodeError:
        return 0  # malformed payload — fail open, don't block work
    tool_input = payload.get("tool_input") or {}
    command = tool_input.get("command") or ""
    if not _is_git_commit(command):
        return 0  # not a commit, allow

    repo_root = Path(__file__).resolve().parents[2]
    script = repo_root / "scripts" / "check-skill-integrity.py"
    if not script.exists():
        return 0  # script missing — fail open rather than blocking all commits

    result = subprocess.run(
        ["python3", str(script)],
        cwd=str(repo_root),
        capture_output=True,
        text=True,
    )
    if result.returncode == 0:
        return 0  # clean, allow commit
    # Print findings to stderr so they surface in the tool error message.
    sys.stderr.write(
        "\nBLOCKED by check-skill-integrity.py — fix the findings, then retry.\n\n"
    )
    sys.stderr.write(result.stdout)
    if result.stderr:
        sys.stderr.write(result.stderr)
    return 2  # non-zero blocks the tool call


if __name__ == "__main__":
    sys.exit(main())
