return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Backing - Hexagon",
	localizations = {},
	mod_version = 1,
	name = "bdi_backing_hex",
	nodes = {
		{
			callbacks = {
				value = {
					visible = {
						body = [[
							state.bdi = state.bdi or get_mod("better_downed_indicators")
							visible = state.bdi and state.bdi.should_show(sources.player_1)
						]],
						kind = "code",
						source = "player_1",
					},
				},
			},
			id = "rect_1",
			label = "Hexagon Backing",
			offset = {
				0,
				0,
			},
			style = {
				color = {
					150,
					0,
					0,
					0,
				},
				size = {
					85,
					75,
				},
			},
			type = "rect",
			values = {
				material = "content/ui/materials/icons/talents/zealot_3/zealot_3_combat",
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

	summary = "Dark ability/hexagonal backdrop for the Better Downed Indicators status icon. Visible only when the player has an active status.",
	version = 2,
}
