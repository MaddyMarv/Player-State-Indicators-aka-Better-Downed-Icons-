return {
	export_mod = "better_downed_indicators",
	gamemodes = {
		meatgrinder = true,
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
						body = "local p = sources.player_1\nif p and p.state and p.state.exists == false then visible = false return end\nlocal get_icon = block.state.status_icon\nvisible = get_icon and get_icon(p) ~= nil",
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
	script = {
		body = "if not state.bdi then\n  state.bdi = get_mod(\"better_downed_indicators\")\nend\nif not state.bdi then return end\nstate.status_icon = state.bdi.hud_studio_status_icon",
	},
	summary = "Dark circular backdrop for the Better Downed Indicators status icon. Visible only when the player has an active status.",
	version = 3,
}
