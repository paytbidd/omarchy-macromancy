# Macromancy

Mac Command muscle memory for [Omarchy](https://omarchy.org/).

The key next to Space (Alt on a PC board, Command on a Mac) becomes Super. Select all, undo, redo, hide, and quit then follow that thumb. Copy, paste, and cut are already Super+C / Super+V / Super+X in stock Omarchy; this plugin leaves those alone.

## Install

One shot:

```bash
curl -fsSL https://raw.githubusercontent.com/paytbidd/omarchy-macromancy/main/install | bash
```

Or:

```bash
omarchy plugin add https://github.com/paytbidd/omarchy-macromancy.git --yes --enable
~/.config/omarchy/plugins/payton.macromancy/scripts/omarchy-macromancy apply
```

That will:

1. Enable the plugin
2. Drop `~/.config/hypr/macromancy.lua` and load it from `hyprland.lua` (a marked block only)
3. Swap physical Alt and Win (`altwin:swap_alt_win`) on top of Omarchy’s default `kb_options`
4. Bind the shortcuts below

`kb_options` is replaced, not merged. If you already set extra XKB options (layouts, `grp:alts_toggle`, …), copy them into `~/.config/hypr/macromancy.lua` next to `altwin:swap_alt_win`.

## Shortcuts

| You press | Mac habit | What happens |
|---|---|---|
| Physical Alt (next to Space) | Command | Super |
| Physical Win | Option | Alt |
| Super+A | Cmd+A | Select all (Ctrl+A) |
| Super+Z | Cmd+Z | Undo (Ctrl+Z) |
| Super+Shift+Z | Cmd+Shift+Z | Redo (Ctrl+Shift+Z) |
| Super+H | Cmd+H | Hide window (scratchpad, app keeps running) |
| Super+Q | Cmd+Q | Quit (close window) |
| Super+C / Super+V / Super+X | Cmd+C/V/X | Stock Omarchy copy / paste / cut |

Ctrl is unchanged, so Emacs/readline chords stay on the Control key.

**Terminals:** Super+A / Super+Z / Super+Shift+Z do nothing in a terminal. Ctrl+A is beginning-of-line and Ctrl+Z is suspend; injecting those would steal both. Hide and quit still work.

**Hide vs quit:** Super+H stashes the window on `special:scratchpad` without following it. Super+S still toggles the scratchpad. Super+Q sends a close request, same dispatcher as Super+W. If another plugin remaps Super+W (Apple Music Mini hides instead of closing), Super+Q remains a real quit.

These Super chords were free in stock Omarchy. Super+Shift+A (ChatGPT), Super+Ctrl+A (Audio), Super+Ctrl+Z (Zoom in), and Super+Ctrl+Q (Calculator) are unchanged.

## Unapply

```bash
~/.config/omarchy/plugins/payton.macromancy/scripts/omarchy-macromancy unapply
```

Remove the plugin too:

```bash
curl -fsSL https://raw.githubusercontent.com/paytbidd/omarchy-macromancy/main/uninstall | bash
```

or:

```bash
~/.config/omarchy/plugins/payton.macromancy/scripts/omarchy-macromancy unapply --purge
```

Unapply restores PC Alt/Win placement unless you still set `altwin:swap_alt_win` in `input.lua`.

## Update

```bash
omarchy plugin update payton.macromancy
~/.config/omarchy/plugins/payton.macromancy/scripts/omarchy-macromancy apply
```

## Status

```bash
~/.config/omarchy/plugins/payton.macromancy/scripts/omarchy-macromancy status
```
