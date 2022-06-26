local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.init_lsp_saga({
	-- Error,Warn,Info,Hint
	-- use emoji
	-- like {'🙀','😿','😾','😺'}
	-- {'😡','😥','😤','😐'}
	-- and diagnostic_header can be a function type
	-- must return a string and when diagnostic_header
	-- is fucntion type it will have a param `entry`
	-- entry is a table type has these filed
	-- {bufnr,code,col,end_col,end_lnum,lnum,message,severity,source}
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	-- show diagnostic source
	show_diagnostic_source = true,
	-- add bracket or something with diagnostic source,just have 2 elements
	diagnostic_source_bracket = {},
	-- use emoji lightbulb in default
	code_action_icon = "💡",
	-- if true can press number to execute the codeaction in codeaction window
	code_action_num_shortcut = true,
	-- same as nvim-lightbulb but async
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = true,
	},
	-- separator in finder
	finder_separator = "  ",
	-- preview lines of lsp_finder and definition preview
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	definition_preview_icon = "  ",
	-- "single" "double" "rounded" "bold" "plus"
	border_style = "single",
	-- if you don't use nvim-lspconfig you must pass your server name and
	-- the related filetypes into this table
	-- like server_filetype_map = {metals = {'sbt', 'scala'}}
	server_filetype_map = {},
})
