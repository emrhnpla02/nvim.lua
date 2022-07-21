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

local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
