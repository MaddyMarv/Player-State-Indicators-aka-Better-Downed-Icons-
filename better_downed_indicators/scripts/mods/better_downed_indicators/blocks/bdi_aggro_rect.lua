return {
	export_mod = "better_downed_indicators",
	gamemodes = {
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
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\nlocal bdi = state.bdi\ncolor = bdi and bdi.hud_studio_aggro_color(sources.player_1) or { 0, 255, 255, 255 }",
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\nlocal bdi = state.bdi\nvisible = bdi and bdi.hud_studio_aggro_color(sources.player_1) ~= nil",
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
	summary = "Rectangular glowing threat border for Better Downed Indicators. Lights up with attacker-specific colors when targeted by enemies (Snipers, Poxbursters, Disablers, Bosses, etc.).",
	version = 1,
}
