require("jester").setup({
	cmd = "jest -t '$result' -- $file",
	identifiers = { "test", "it" },
	prepend = { "describe" },
	expressions = { "call_expression" },
	path_to_jest_run = "jest",
	path_to_jest_debug = "./node_modules/bin/jest",
	terminal_cmd = ":vsplit | terminal",
	dap = {
		type = "node2",
		request = "launch",
		cwd = vim.fn.getcwd(),
		runtimeArgs = { "--inspect-brk", "$path_to_jest", "--no-coverage", "-t", "$result", "--", "$file" },
		args = { "--no-cache" },
		sourceMaps = "inline",
		protocol = "inspector",
		skipFiles = { "<node_internals>/**/*.js" },
		console = "integratedTerminal",
		port = 9229,
		disableOptimisticBPs = true,
	},
})
