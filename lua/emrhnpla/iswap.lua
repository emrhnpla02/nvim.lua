local status_ok, iswap = pcall(require, "iswap")
if not status_ok then
	return
end

iswap.setup({
	-- The keys that will be used as a selection, in order
	-- ('asdfghjklqwertyuiopzxcvbnm' by default)
	keys = "qwertyuiop",

	-- Grey out the rest of the text when making a selection
	-- (enabled by default)
	grey = "enabled",

	-- Highlight group for the sniping value (asdf etc.)
	-- default 'Search'
	hl_snipe = "ErrorMsg",

	-- Highlight group for the visual selection of terms
	-- default 'Visual'
	hl_selection = "WarningMsg",

	-- Highlight group for the greyed background
	-- default 'Comment'
	hl_grey = "LineNr",

	-- Automatically swap with only two arguments
	-- default nil
	autoswap = true,

	-- Other default options you probably should not change:
	debug = nil,
	hl_grey_priority = "1000",
})