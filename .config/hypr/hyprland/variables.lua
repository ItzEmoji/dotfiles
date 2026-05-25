-- ~/.config/hypr/hyprland/variables.lua

-- Variables
terminal = "kitty"
fileManager = "dolphin"
browser = "firefox"
ipc = "quickshell -c noctalia-shell ipc call "
home = os.getenv("HOME")
color_cache_file = home .. "/.local/cache/noctalia/hyprland-colors.lua"
theme = dofile(color_cache_file)
-- Environment Variables
env = hl.env
env("GTK_THEME", "Nord")

