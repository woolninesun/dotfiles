local theme = {}

theme.dir                                       =
    os.getenv("HOME") .. "/.config/awesome/themes/custom"

theme.wallpaper					                = theme.dir .. "/wall.png"
theme.font                                      = "FuraMono Nerd Font 12"
theme.fg_normal                                 = "#FEFEFE"
theme.fg_focus                                  = "#32D6FF"
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#1E2320"
theme.bg_urgent                                 = "#3F3F3F"

theme.taglist_bg_focus                          = "#007FFF"
theme.taglist_fg_focus                          = theme.fg_normal
theme.tasklist_bg_focus                         = theme.bg_normal
theme.tasklist_fg_focus                         = "#007FFF"

theme.border_width                              = 1
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"

theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_fg_focus                         = theme.fg_focus

theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_wlan0                              = theme.dir .. "/icons/wlan0.png"
theme.widget_eth0                               = theme.dir .. "/icons/eth0.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"

theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0

theme.titlebar_close_button_focus               =
    theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              =
    theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        =
    theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       =
    theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      =
    theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     =
    theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       =
    theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      =
    theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     =
    theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    =
    theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     =
    theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    =
    theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   =
    theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  =
    theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    =
    theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = 
    theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  =
    theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive =
    theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

return theme
