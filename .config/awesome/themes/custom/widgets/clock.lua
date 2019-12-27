-- clock

local lain  = require("lain")
local wibox = require("wibox")
local calendar = require("calendar")

local theme = require("themes.custom.config")

local clock      = wibox.widget.textclock(
                    lain.util.markup(theme.fg_normal, " %H:%M:%S  "), 1 )
      clock.font = theme.font
calendar({}):attach(clock)

return {
    icon   = nil,
    widget = clock
}

