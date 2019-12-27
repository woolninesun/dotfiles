local os, math, string = os, math, string

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local theme = require("themes.custom.config")

local volume  = require("themes.custom.widgets.volume" )
local memory  = require("themes.custom.widgets.memory" )
local cpu     = require("themes.custom.widgets.cpu"    )
-- local fs      = require("themes.custom.widgets.fs"     )
local battery = require("themes.custom.widgets.battery")
local eth0   = require("themes.custom.widgets.eth0"    )
local wlan0   = require("themes.custom.widgets.wlan0"  )
local clock   = require("themes.custom.widgets.clock"  )

local bar_separator = wibox.widget.textbox(
    lain.util.markup.fontfg(theme.font, "#007FFF", "|")
)

local Right_widgets = {
    layout = wibox.layout.fixed.horizontal,
    wibox.widget.systray()
}
for index, widget in pairs({ volume, memory, cpu, fs, battery, eth0, wlan0, clock }) do
    if widget then
        table.insert( Right_widgets, bar_separator )
        table.insert( Right_widgets, wibox.container.background( wibox.container.margin(
            wibox.widget {
                widget.icon, widget.widget, layout = wibox.layout.align.horizontal
            }, 0, 0)
        ) )
    end
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(
        s, awful.widget.taglist.filter.all, awful.util.taglist_buttons
    )

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(
        s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons
    )

    -- Create the wibox
    s.mywibox = awful.wibar(
        {
            screen = s, position = "top", height = 20,
            bg = theme.bg_normal, fg = theme.fg_normal
        }
    ) -- change

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
       
	    { -- Left widgets
            layout = wibox.layout.fixed.horizontal,

            s.mytaglist,
            s.mypromptbox,
        },
    
        s.mytasklist, -- Middle widget
        
	    Right_widgets,
    }
end

return theme
