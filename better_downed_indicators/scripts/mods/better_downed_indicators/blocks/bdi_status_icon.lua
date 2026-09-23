return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Status Icon",
	localizations = {},
	mod_version = 1,
	name = "bdi_status_icon",
	nodes = {
		{
			callbacks = {
				value = {
					material = {
						body = [[
local get_icon = block.state.status_icon
material = get_icon and get_icon(sources.player_1) or nil]],
						kind = "code",
						source = "player_1",
					},
					color = {
						body = [[
local get_color = block.state.status_color
color = get_color and get_color(sources.player_1) or { 255, 255, 255, 255 }]],
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = [[
local p = sources.player_1
if p and p.state and p.state.exists == false then
	visible = false
else
	local get_icon = block.state.status_icon
	visible = (get_icon and get_icon(p) ~= nil) and true or false
end]],
						kind = "code",
						source = "player_1",
					},
				},
			},
			id = "rect_1",
			label = "Status Icon",
			offset = {
				0,
				0,
			},
			style = {
				color = {
					255,
					255,
					255,
					255,
				},
				size = {
					65,
					65,
				},
			},
			type = "rect",
			values = {
				material = "content/ui/materials/mission_board/circumstances/maelstrom_01",
			},
		},
	},
	offset = {
		0,
		0,
	},
	requires = {
		"better_downed_indicators",
	},
	script = {
		body = [[
if not state.bdi then
	state.bdi = get_mod("better_downed_indicators")
end
if not state.bdi then return end
state.status_icon = state.bdi.hud_studio_status_icon
state.status_color = state.bdi.hud_studio_status_color]],
	},
	summary = "Displays the Better Downed Indicators status icon for a player. Requires Better Downed Indicators.",
	version = 3,
}
