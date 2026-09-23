return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Aggro Glow - Circle",
	localizations = {},
	mod_version = 1,
	name = "bdi_aggro_circle",
	nodes = {
		{
			callbacks = {
				value = {
					color = {
						body = "local get_color = block.state.aggro_color\ncolor = get_color and get_color(sources.player_1) or { 0, 255, 255, 255 }",
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = "local p = sources.player_1\nif p and p.state and p.state.exists == false then visible = false return end\nlocal get_color = block.state.aggro_color\nvisible = get_color and get_color(p) ~= nil",
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
				material = "content/ui/materials/frames/talents/circular_frame_glow",
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
		body = "if not state.bdi then\n  state.bdi = get_mod(\"better_downed_indicators\")\nend\nif not state.bdi then return end\nstate.aggro_color = state.bdi.hud_studio_aggro_color",
	},
	summary = "Circular glowing threat border for Better Downed Indicators. Lights up with attacker-specific colors when targeted by enemies (Snipers, Poxbursters, Disablers, Bosses, etc.).",
	version = 3,
}
