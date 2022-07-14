local status_ok, iswap = pcall(require, "iswap")
if not status_ok then
	return
end

iswap.setup({
	keys = "qwertyuiop",
	grey = "enabled",
	hl_snipe = "ErrorMsg",
	hl_selection = "WarningMsg",
	hl_grey = "LineNr",
	autoswap = true,
	debug = nil,
	hl_grey_priority = "1000",
})
