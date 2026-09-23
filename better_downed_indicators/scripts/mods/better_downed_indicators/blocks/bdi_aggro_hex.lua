return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Aggro Glow - Hexagon",
	localizations = {},
	mod_version = 2,
	name = "bdi_aggro_hex",
	nodes = {
		{
			callbacks = {
				value = {
					color = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\
color = state.bdi and state.bdi.get_aggro_color(sources.player_1) or { 0, 255, 255, 255 }",
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\
visible = state.bdi and state.bdi.should_show_aggro(sources.player_1)",
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
					95,
					85,
				},
			},
			type = "rect",
			values = {
				material = "content/ui/materials/frames/talents/hex_frame_glow",
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

	summary = "Hexagonal glowing threat border for Better Downed Indicators. Lights up with attacker-specific colors when targeted by enemies (Snipers, Poxbursters, Disablers, Bosses, etc.).",
	version = 2,
}
