-- Monitors --
hl.monitor({
	output = "DP-2",
	mode = "2560x1440@143.97",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@100",
	position = "2560x0",
	scale = 1,
})

-- Autostart --
hl.on("hyprland.start", function ()
	hl.exec_cmd("waybar")
	hl.exec_cmd("waypaper --restore")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Custom functions --
function activate_gamemode()
	hl.config({
		animations = { enabled = false },
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			active_opacity = 1.0,
			inactive_opacity = 1.0,
			fullscreen_opacity = 1.0,
			rounding = 0
		},
		general = {
			gaps_in = 0,
			gaps_out = 0,
			border_size = 1,
		}
	})
end

-- Environment variables --
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")

-- Look and feel --
hl.config({
	general = {
		gaps_in = 10,
		gaps_out = 20,
		border_size = 2,

		col = {
			active_border = "rgb(f5c2e7)",
			inactive_border = "rgb(9aa5ce)",
		},

		resize_on_border = false,
		allow_tearing = true,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 32,
			render_power = 2,
			color = "rgba(00000050)",
		},

		blur = {
			enabled = true,
			size = 10,
			passes = 2,
			vibrancy = 0.1696,
			new_optimizations = true,
			xray = true,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		vrr = 2,
		middle_click_paste = false,
	},

	input = {
		repeat_rate = 50,
		repeat_delay = 300,
		follow_mouse = 1,
		sensitivity = 0,
		accel_profile = "flat",
	},

	render = {
		direct_scanout = 1,
	},

	xwayland = {
		use_nearest_neighbor = 0,
		force_zero_scaling = 1,
		create_abstract_socket = 1,
	},

	cursor = {
		use_cpu_buffer = 0,
		no_hardware_cursors = 1,
	},
})

-- Animations --
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("md3_standard", { type = "bezier", points = { {0.2, 0}, {0, 1} } })
hl.curve("md3_decel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} } })
hl.curve("md3_accel", { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} } })
hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
hl.curve("crazyshot", { type = "bezier", points = { {0.1, 1.5}, {0.76, 0.92} } })
hl.curve("hyprnostretch", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })
hl.curve("menu_decel", { type = "bezier", points = { {0.1, 1}, {0, 1} } })
hl.curve("menu_accel", { type = "bezier", points = { {0.38, 0.04}, {1, 0.07} } })
hl.curve("easeInOutCirc", { type = "bezier", points = { {0.85, 0}, {0.15, 1} } })
hl.curve("easeOutCirc", { type = "bezier", points = { {0, 0.55}, {0.45, 1} } })
hl.curve("easeOutExpo", { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })
hl.curve("softAcDecel", { type = "bezier", points = { {0.26, 0.26}, {0.15, 1} } })
hl.curve("md2", { type = "bezier", points = { {0.4, 0}, {0.2, 1} } })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "md3_accel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "md3_decel" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 4.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })

-- Keybinds & default programs --
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "fuzzel"
local browser = "brave-origin"
local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",          hl.dsp.window.close())
hl.bind(mainMod .. " + B",          hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + Q",  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R",          hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + I",          hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + K",          hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + L",          hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + I",  hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + SHIFT + J",  hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + K",  hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
hl.bind(mainMod .. " + SHIFT + L",  hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + I",   hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + J",   hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + K",   hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + L",   hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + TAB",        hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SPACE",      hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + B",  hl.dsp.exec_cmd("killall waybar && waybar &"))
hl.bind(mainMod .. " + T",          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + ALT + G",    hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))
hl.bind(mainMod .. " + BACKSLASH",  hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("XF86AudioRaiseVolume",     hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume",     hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -5%"))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Windows & workspaces --
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	match = { class = "^(steam_app_.*)$" },
	immediate = true,
})

hl.window_rule({
	match = { class = "(.*waypaper.*)" },
	float = true,
})

hl.window_rule({
	match = { class = "(.*ProtonPlus.*)" },
	float = true,
})

hl.window_rule({
	match = { class = "(.*org.pulseaudio.pavucontrol.*)" },
	float = true,
	pin = true,
	center = true,
	size = {700, 600},
})

hl.window_rule({
	match = { class = "(hyprland-share-picker)" },
	float = true,
	pin = true,
	center = true,
	size = {600, 400},
})

hl.workspace_rule({ workspace = "1", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "DP-2", default = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", default = true })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "launcher" }, blur = true })
