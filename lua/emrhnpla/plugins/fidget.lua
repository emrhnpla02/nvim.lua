local figdet_status_ok, fidget = pcall(require, "fidget")
if not figdet_status_ok then
	return
end

fidget.setup({
	text = {
		spinner = "moon",
		commenced = "",
		completed = "",
	},
	window = {
		relative = "editor",
		blend = 0,
	},
})
