-- Nord
local nord_options = {
	nord_contrast = true,
	nord_borders = true,
	nord_disable_background = true,
	nord_enable_sidebar_background = false,
	nord_cursorline_transparent = true,
	nord_italic = false,
	nord_uniform_diff_background = true,
}

for key, value in pairs(nord_options) do
	vim.g[key] = value
end

-- Gruvbox
local gruvbox_status_ok, gruvbox = pcall(require, "gruvbox")
if not gruvbox_status_ok then
	return
end

gruvbox.setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = true,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true,
	contrast = "",
	overrides = {},
})

-- Tokyonight
local tokyonight_options = {
	tokyonight_style = "storm",
	tokyonight_terminal_colors = true,
	tokyonight_italic_comments = true,
	tokyonight_italic_keywords = true,
	tokyonight_italic_functions = false,
	tokyonight_italic_variables = false,
	tokyonight_transparent = false,
	tokyonight_hide_inactive_statusline = false,
	tokyonight_sidebars = {},
	tokyonight_transparent_sidebar = false,
	tokyonight_dark_sidebar = true,
	tokyonight_dark_float = true,
	tokyonight_colors = {},
	tokyonight_day_brightness = 0.3,
	tokyonight_lualine_bold = true,
}

for key, value in pairs(tokyonight_options) do
	vim.g[key] = value
end

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
