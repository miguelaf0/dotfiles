local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appereance
config.color_scheme = 'Apple System Colors'
config.font_size = 13
config.window_padding = { left = 10, right = 10, top = 8, bottom = 8 }
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'JetBrains Mono'

-- Behavior
config.scrollback_lines = 20000
config.enable_scroll_bar = false
config.front_end = 'WebGpu'

-- Keybindings
local act = wezterm.action
config.keys = {
  { key = 'd', mods = 'ALT',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'D', mods = 'ALT|SHIFT', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'ALT',       action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'ALT',       action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'ALT',       action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'ALT',       action = act.ActivatePaneDirection 'Down' },
  { key = 'z', mods = 'ALT',       action = act.TogglePaneZoomState },
}

-- Platform-specific settings
if wezterm.target_triple:find('windows') then
	config.default_domain = 'WSL:Ubuntu'
end


return config
