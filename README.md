# Macromancy

For Mac users who came to [Omarchy](https://omarchy.org/) on **Windows / PC hardware**.

You still reach for Command next to Space. On a PC board that key is Alt. Macromancy makes it Super, then maps the usual Cmd chords onto it. Copy, paste, and cut are already Super+C / Super+V / Super+X in stock Omarchy; this plugin leaves those alone.

## Who this is for

A typical Mac user on a **PC keyboard** (laptop or desktop): Alt sits next to Space, Win sits one key further out. Your thumb still wants Command there.

**Not for Apple keyboards.** On a Mac board, Command is already Super. The Alt/Win swap would put Option under your Command thumb. Skip this pack, or use only the shortcut file and delete the `kb_options` swap.

This is not a full macOS shortcut table. Save, Find, New Tab, and Spotlight stay Omarchy’s tiling and menu keys (Super+S / Super+F / Super+T / Super+Space).

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

## Super+K

The Omarchy keybindings menu (Super+K) reads live Hyprland binds. After apply you should see:

| Menu chord | Menu label |
|---|---|
| Super+A | Universal select all |
| Super+Z | Universal undo |
| Super+Shift+Z | Universal redo |
| Super+H | Hide window (scratchpad) |
| Super+Q | Quit window |
| Super+C / Super+V / Super+X | Universal copy / paste / cut (stock) |

The Alt/Win Command swap is keyboard options, not a bind, so it does not get its own Super+K row. Super in that menu is already the remapped Command key.

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
