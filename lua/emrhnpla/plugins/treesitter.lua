local status_of, configs = pcall(require, "nvim-treesitter.configs")
if not status_of then
	return
end

configs.setup({
	sync_install = false,
	ignore_install = { "" },
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
})
