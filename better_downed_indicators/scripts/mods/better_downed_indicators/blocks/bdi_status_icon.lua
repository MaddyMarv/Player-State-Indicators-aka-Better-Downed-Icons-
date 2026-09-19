return {
	export_mod = "better_downed_indicators",
	gamemodes = {
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
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\nlocal bdi = state.bdi\nmaterial = bdi and bdi.hud_studio_status_icon(sources.player_1) or nil",
						kind = "code",
						source = "player_1",
					},
					color = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\nlocal bdi = state.bdi\ncolor = bdi and bdi.hud_studio_status_color(sources.player_1) or { 255, 255, 255, 255 }",
						kind = "code",
						source = "player_1",
					},
					visible = {
						body = "state.bdi = state.bdi or get_mod(\"better_downed_indicators\")\nlocal bdi = state.bdi\nvisible = bdi and bdi.hud_studio_status_icon(sources.player_1) ~= nil",
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
	version = 1,
}
