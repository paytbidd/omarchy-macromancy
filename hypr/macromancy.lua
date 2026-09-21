-- Macromancy: Mac Command habits on a PC keyboard, for Omarchy.
-- Physical Alt (next to Space) is Super. Super+C/V/X stay stock Omarchy.
-- Do not use the Alt/Win swap on an Apple keyboard; Command is already Super.

-- kb_options is replaced, not merged. Keep Omarchy compose/capslock and
-- add altwin:swap_alt_win. Extra layout options belong here too.
hl.config({
  input = {
    kb_options = "compose:caps,shift:both_capslock_cancel,altwin:swap_alt_win",
  },
})

-- Inject Ctrl chords. send_shortcut would merge the held Super key.
-- Down/up split matches default/hypr/bindings/clipboard.lua.
local function send_shortcut_once(mods, key)
  hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
  hl.timer(function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
  end, { timeout = 50, type = "oneshot" })
end

local function active_window_is_terminal()
  local window = hl.get_active_window()
  if not window then
    return false
  end
  for _, tag in ipairs(window.tags or {}) do
    if tag:gsub("%*$", "") == "terminal" then
      return true
    end
  end
  return false
end

-- Skip terminals: Ctrl+A is beginning-of-line, Ctrl+Z is suspend.
local function app_shortcut(mods, key)
  return function()
    if active_window_is_terminal() then
      return
    end
    send_shortcut_once(mods, key)
  end
end

-- Descriptions are Super+K labels. "Universal …" matches stock copy/paste/cut
-- so those rows sit together in the keybindings menu.
o.bind("SUPER + A", "Universal select all", app_shortcut("CTRL", "A"))
o.bind("SUPER + Z", "Universal undo", app_shortcut("CTRL", "Z"))
o.bind("SUPER + SHIFT + Z", "Universal redo", app_shortcut("CTRL SHIFT", "Z"))

-- Hide is Cmd+H: stash the window, keep it running. Super+S still shows
-- the scratchpad. Super+Alt+S remains the same move. Quit is Cmd+Q:
-- close the window (Apple Music Mini can keep Super+W as hide-instead).
o.bind("SUPER + H", "Hide window (scratchpad)", hl.dsp.window.move({
  workspace = "special:scratchpad",
  follow = false,
}))
o.bind("SUPER + Q", "Quit window", hl.dsp.window.close())
