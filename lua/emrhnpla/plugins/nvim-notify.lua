local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	stages = "slide",
	on_open = nil,
	on_close = nil,
	timeout = 5000,
	render = "default",
	background_colour = "Normal",
	minimum_width = 50,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

vim.notify = notify
