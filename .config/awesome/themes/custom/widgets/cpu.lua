-- cpu

local lain  = require("lain")
local wibox = require("wibox")

local theme = require("themes.custom.config")

local cpu = lain.widget.cpu({
    settings = function()
        cpu_now.usage = string.format("%2d", cpu_now.usage)
        widget:set_markup(
            lain.util.markup.font(theme.font, " " .. cpu_now.usage .. "% ")
        )
    end
})

return {
    icon   = wibox.widget.imagebox(theme.widget_cpu),
    widget = cpu.widget
}

