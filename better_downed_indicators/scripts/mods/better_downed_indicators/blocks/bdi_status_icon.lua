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
	mod_version = 2,
	name = "bdi_status_icon",
	nodes = {
		{
			callbacks = {
				value = {
					material = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\
material = state.bdi and state.bdi.get_icon(sources.player_1)",
						kind = "code",
						source = "player_1",
					},
					color = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\
color = state.bdi and state.bdi.get_color(sources.player_1)",
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\
visible = state.bdi and state.bdi.should_show(sources.player_1)",
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

	summary = "Displays the Better Downed Indicators status icon for a player. Requires Better Downed Indicators.",
	version = 2,
}
