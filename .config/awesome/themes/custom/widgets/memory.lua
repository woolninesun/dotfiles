-- memory

local lain  = require("lain")
local wibox = require("wibox")

local theme = require("themes.custom.config")

local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(
            lain.util.markup.font(theme.font, " " .. mem_now.used .. "MB ")
        )
    end
})

return {
    icon   = wibox.widget.imagebox(theme.widget_mem),
    widget = memory.widget
}

