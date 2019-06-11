-- Author url = http://dobbie03.deviantart.com/art/My-First-Conky-Config-327206399
-- Modified by Akza

-- vim: ts=4 sw=4 noet ai cindent syntax=lua

--[[
Conky, a system monitor, based on torsmo
]]

conky.config = {
-- common
  alignment = 'middle_middle',
  background = false,
  double_buffer = true,
  total_run_times = 0,
  update_interval = 1,

-- border
  border_inner_margin = 5,
  border_outer_margin = 5,
  border_width = 5,

-- color
  -- #413536 # grey 5f5f5f 3F3F3F 183149 3B3B3B 26211F
  default_color = '#ffffff',

-- draw options
  draw_borders = false,
  draw_outline = false,
  draw_shades = false,

-- positioning
  gap_x = 0,
  gap_y = 0,
  maximum_width = 2000,
  minimum_height = 0,
  minimum_width = 0,

  no_buffers = true,
  override_utf8_locale = true,

-- window
  own_window = true,
  own_window_title = 'conky',
  own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
  own_window_transparent = true,

-- 'normal', 'dock', 'panel', 'desktop', 'override'
  own_window_type = 'normal',

  own_window_argb_value = 0,
  own_window_argb_visual = true,
  own_window_colour = '#000000',

-- text
  text_buffer_size = 8000,
  uppercase = false,
  
-- font  
  use_xft = true,
  xftalpha = 1,
  xftfont = 'Freesans:pixelsize=9',

--				fonts
--	Blue Highway
--	Zegoe Light - U
--	Zekton
--	Calibri
--	Engebrechtre
--	Opeln2001
--	Pricedown
}

datetime = ''
.. '${font BankGothic Md BT:pixelsize=15}'
.. '${alignc}'
.. '${time [ %A, %I:%M:%S ]}'
.. '\n'
.. '${alignc}'
.. '${time %d %B, %Y}'
.. '\n'

message = ''
.. "${font BankGothic Md BT:pixelsize=30}"
.. "${alignc}"
.. "Let's Get Married!"
.. "\n"

cpu_usage = 'CPU Usage: ${cpu}% - RAM Usage: ${mem}'

root = 'Root: ${fs_free /} / ${fs_size /}'

battery = 'Battery: ${battery_percent BAT0}% -'
.. ' Remaining Time: ${battery_time BAT0} '

user = 'User: ${exec users} - System Uptime: ${uptime_short}'

wlan = 'wlp3s0'

net_up = 'Net Up: '
.. '${if_existing /proc/net/route ' .. wlan .. '}'
..   '${upspeed ' .. wlan .. '}'
.. '${else}'
..   '${if_existing /proc/net/route eth0}'
..     '${upspeed ' .. wlan .. '}'
..   '${endif}'
.. '${endif}'

net_down = 'Net Down: '
.. '${if_existing /proc/net/route ' .. wlan .. '}'
..   '${downspeed ' .. wlan .. '}'
.. '${else}'
..   '${if_existing /proc/net/route eth0}'
..     '${downspeed ' .. wlan .. '}'
..   '${endif}'
.. '${endif}'

monitor = ''
.. '${font BankGothic Md BT:pixelsize=12}'
.. '${alignc}[ ' .. cpu_usage .. ' ]\n'
.. '${alignc}[ ' .. root .. ' ]\n'
-- '${alignc}[ ' .. battery .. ' ]\n'
.. '${alignc}[ ' .. user .. ' ]\n'
.. '${alignc}[ ' .. net_up .. ' ' ..net_down .. ' ]\n'

conky.text = ''
.. datetime
.. message 
.. ''
.. monitor


