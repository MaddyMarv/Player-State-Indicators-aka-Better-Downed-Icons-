return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Aggro Glow - Rectangle",
	localizations = {},
	mod_version = 1,
	name = "bdi_aggro_rect",
	nodes = {
		{
			callbacks = {
				value = {
					color = {
						body = [[
local get_color = block.state.aggro_color
color = get_color and get_color(sources.player_1) or { 0, 255, 255, 255 }]],
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = [[
local p = sources.player_1
if p and p.state and p.state.exists == false then
	visible = false
else
	local get_color = block.state.aggro_color
	visible = (get_color and get_color(p) ~= nil) and true or false
end]],
						kind = "code",
						source = "player_1",
					},
				},
			},
			id = "rect_1",
			label = "Aggro Glow",
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
					85,
					85,
				},
			},
			type = "rect",
			values = {
				material = "content/ui/materials/frames/talents/square_frame_glow",
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
state.aggro_color = state.bdi.hud_studio_aggro_color]],
	},
	summary = "Rectangular glowing threat border for Better Downed Indicators. Lights up with attacker-specific colors when targeted by enemies (Snipers, Poxbursters, Disablers, Bosses, etc.).",
	version = 3,
}
