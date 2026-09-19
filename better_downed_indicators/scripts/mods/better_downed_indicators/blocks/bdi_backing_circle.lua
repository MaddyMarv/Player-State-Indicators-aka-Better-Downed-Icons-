return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Backing - Circle",
	localizations = {},
	mod_version = 1,
	name = "bdi_backing_circle",
	nodes = {
		{
			callbacks = {
				value = {
					visible = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\nlocal bdi = state.bdi\nvisible = bdi and bdi.hud_studio_status_icon(sources.player_1) ~= nil",
						kind = "code",
						source = "player_1",
					},
				},
			},
			id = "rect_1",
			label = "Circle Backing",
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
					75,
					75,
				},
			},
			type = "rect",
			values = {
				material = "content/ui/materials/backgrounds/scanner/scanner_drill_circle_filled",
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
	summary = "Dark circular backdrop for the Better Downed Indicators status icon. Visible only when the player has an active status.",
	version = 1,
}
