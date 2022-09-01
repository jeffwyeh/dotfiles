local wezterm = require 'wezterm'
return {
   font = wezterm.font('FiraCode Nerd Font Mono', {
      weight = 'Regular',
      font_size = 13,
   }),
   color_scheme = "OneDark (base16)",
   window_background_opacity = 0.9,
   use_fancy_tab_bar = true,
   window_frame = {
      inactive_titlebar_bg = '#FFFFFF',
   },
   colors = {
      tab_bar = {
      }
   }
}
