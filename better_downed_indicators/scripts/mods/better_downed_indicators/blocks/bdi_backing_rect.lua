return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
		mission = true,
	},
	grid_cols = 0,
	grid_rows = 0,
	label = "BDI Backing - Rectangle",
	localizations = {},
	mod_version = 1,
	name = "bdi_backing_rect",
	nodes = {
		{
			callbacks = {
				value = {
					visible = {
						body = "local get_icon = block.state.status_icon\nvisible = get_icon and get_icon(sources.player_1) ~= nil",
						kind = "code",
						source = "player_1",
					},
				},
			},
			id = "rect_1",
			label = "Rectangle Backing",
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
				material = "content/ui/materials/hud/interactions/frames/line",
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
		body = "if not state.bdi then\n  state.bdi = get_mod(\"better_downed_indicators\")\nend\nif not state.bdi then return end\nstate.status_icon = state.bdi.hud_studio_status_icon",
	},
	summary = "Dark rectangular backdrop for the Better Downed Indicators status icon. Visible only when the player has an active status.",
	version = 2,
}
