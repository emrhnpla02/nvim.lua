local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = true,
			z = true,
			g = true,
		},
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "center",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["a"] = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
	["h"] = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp Finder" },
	["c"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
	["T"] = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
	["R"] = {
		"<cmd>:Lspsaga rename<CR>",
		"Rename",
	},
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	["o"] = { "<cmd>SymbolsOutline<CR>", "Symbols" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
		"Buffers",
	},
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, hidden=true})<CR>",
		"Find files",
	},
	["m"] = { "<cmd>Telescope media_files<CR>", "Find Media Files" },
	["F"] = { "<cmd>Telescope live_grep<CR>", "Find Text" },
	["P"] = { "<cmd>Telescope projects<CR>", "Projects" },
	w = {
		s = { "<cmd>split<CR>", "Split Window" },
		v = { "<cmd>vsplit<CR>", "Split Window Vertically" },
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<CR>", "Compile" },
		i = { "<cmd>PackerInstall<CR>", "Install" },
		s = { "<cmd>PackerSync<CR>", "Sync" },
		S = { "<cmd>PackerStatus<CR>", "Status" },
		u = { "<cmd>PackerUpdate<CR>", "Update" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
	},
	l = {
		name = "LSP",
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		r = { "<cmd>Telescope lsp_references<CR>", "References" },
		a = { "<cmd>Lspsaga code_action<CR>", "Code Actions" },
		i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
		t = { "<cmd>Telescope lsp_type_definitions<CR>", "Type Definitions" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
		l = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })", "Float Diagnostic" },
		d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
		D = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
		w = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
	},
	d = {
		name = "DAP",
		b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
		c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
		k = { "<cmd>lua require('dap').step_out()<CR>", "Step out" },
		l = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
		j = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
		_ = { "<cmd>lua require('dap').run_last()<CR>", "Run last" },
		u = { "<cmd>lua require('dapui').toggle()<CR>", "DAP UI" },
		s = { "<cmd>lua require('dapui').float_element('scopes')<CR>", "Scopes" },
		S = { "<cmd>lua require('dapui').float_element('stacks')<CR>", "Stacks" },
		w = { "<cmd>lua require('dapui').float_element('watches')<CR>", "Watches" },
		B = { "<cmd>lua require('dapui').float_element('breakpoints')<CR>", "Breakpoints" },
		r = { "<cmd>lua require('dapui').float_element('repl')<CR>", "Repl" },
		i = {
			"<cmd>lua require('dap.ui.variables').hover(function () return vim.fn.expand('<cexpr>') end)<CR>",
			"Hover",
		},
		I = { "<cmd>lua require('dap').repl.open({}, 'vsplit')<CR>", "Inspect" },
		e = { "<cmd>lua require('dap').set_exception_breakpoints({'all'})<CR>", "Set exception breakpoints" },
	},
	r = {
		name = "Rust",
		m = {
			name = "Move",
			u = { "<cmd>RustMoveItemUp<CR>", "Move Item Up" },
			d = { "<cmd>RustMoveItemDown<CR>", "Move Item Down" },
		},
		h = { "<cmd>RustToggleInlayHints<CR>", "Toggle Inlay Hints" },
		r = { "<cmd>RustRunnables<CR>", "Runnables" },
		d = { "<cmd>RustDebuggables<CR>", "Debuggables" },
		e = { "<cmd>RustExpandMacro<CR>", "Expand Macro" },
		a = { "<cmd>RustHoverActions<CR>", "Hover Actions" },
		j = { "<cmd>RustJoinLines<CR>", "Join Lines" },
		c = { "<cmd>RustOpenCargo<CR>", "Open Cargo.toml" },
		p = { "<cmd>RustParentModule<CR>", "Parent Module" },
		w = { "<cmd>RustReloadWorkspace<CR>", "Reload Workspace" },
		g = { "<cmd>RustViewCrateGraph<CR>", "View Crate Graph" },
		D = { "<cmd>RustOpenExternalDocs<CR>", "Open External Docs" },
		s = { "<cmd>RustSSR<CR>", "Structural Search Replace" },
		b = { "<cmd>RustStartStandaloneServerForBuffer<CR>", "Start Standalone Server for Buffer" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
		p = { "<cmd>Telescope projects<CR>", "Projects" },
		M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
		R = { "<cmd>Telescope registers<CR>", "Registers" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		C = { "<cmd>Telescope commands<CR>", "Commands" },
	},
	t = {
		name = "Terminal",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		f = { "<cmd>lua _TMUX_TOGGLE()<CR>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
	},
}

local vopts = {
	mode = "v",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
	["r"] = { "<cmd>lua require('react-extract').extract_to_new_file()<CR>", "Extract React Component" },
	d = {
		name = "DAP",
		i = {
			"<cmd>lua require('dap.ui.variables').visual_hover()<CR>",
			"Visual Hover",
		},
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
