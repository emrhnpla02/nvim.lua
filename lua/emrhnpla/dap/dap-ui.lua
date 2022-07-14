local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
	return
end

local status_ok_dapui, dapui = pcall(require, "dapui")
if not status_ok_dapui then
	return
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "h", "l" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.25,
				},
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 00.25 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = { "repl" },
			size = 10,
			position = "bottom",
		},
		floating = {
			max_height = nil,
			max_width = nil,
			border = "rounded",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
	},
})
