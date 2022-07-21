local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
	return
end

local status_ok_preview, fold_preview = pcall(require, "fold-preview")
if not status_ok_preview then
	return
end

pretty_fold.setup({
	sections = {
		left = {
			"━ ",
			function()
				return string.rep("*", vim.v.foldlevel)
			end,
			" ━┫",
			"content",
			"┣",
		},
		right = {
			"┫ ",
			"number_of_folded_lines",
			": ",
			"percentage",
			" ┣━━",
		},
	},
	fill_char = "━",
	remove_fold_markers = true,
	keep_indentation = false,
	process_comment_signs = "spaces",
	comment_signs = {},
	stop_words = {
		"@brief%s*",
	},
	add_close_pattern = true,
	matchup_patterns = {
		{ "{", "}" },
		{ "%(", ")" },
		{ "%[", "]" },
	},

	ft_ignore = { "neorg" },
})

fold_preview.setup({ border = "rounded" })
