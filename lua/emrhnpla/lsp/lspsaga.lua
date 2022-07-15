local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.init_lsp_saga({
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	show_diagnostic_source = true,
	diagnostic_source_bracket = {},
	code_action_icon = "💡",
	code_action_num_shortcut = true,
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = false,
	},
	max_preview_lines = 10,
	finder_action_keys = {
		open = "l",
		vsplit = "v",
		split = "s",
		quit = "<ESC>",
		scroll_down = "j",
		scroll_up = "k",
	},
	code_action_keys = {
		quit = "<ESC>",
		exec = "<CR>",
	},
	definition_preview_icon = "  ",
	border_style = "single",
	server_filetype_map = {},
})
