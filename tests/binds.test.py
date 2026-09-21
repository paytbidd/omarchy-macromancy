#!/usr/bin/env python3
from pathlib import Path

root = Path(__file__).resolve().parents[1]
lua = (root / "hypr" / "macromancy.lua").read_text()
needles = [
    "altwin:swap_alt_win",
    '"SUPER + A"',
    '"SUPER + Z"',
    '"SUPER + SHIFT + Z"',
    '"SUPER + H"',
    '"SUPER + Q"',
    "special:scratchpad",
    'app_shortcut("CTRL", "A")',
    'app_shortcut("CTRL", "Z")',
    'app_shortcut("CTRL SHIFT", "Z")',
    "Universal select all",
    "Universal undo",
    "Universal redo",
    "Hide window (scratchpad)",
    "Quit window",
]
missing = [s for s in needles if s not in lua]
if missing:
    raise SystemExit("missing in macromancy.lua: " + ", ".join(missing))
print("ok")
