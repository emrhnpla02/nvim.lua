local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"dockerls",
	"html",
	"jsonls",
	"omnisharp",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"taplo",
	"tsserver",
	"volar",
	"zk",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("emrhnpla.lsp.handlers").on_attach,
		capabilities = require("emrhnpla.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("emrhnpla.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "rust_analyzer" then
		local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
		if not rust_tools_status_ok then
			return
		end

		rust_tools.setup({
			tools = {
				on_initialized = function()
					vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
				end,
			},
			server = {
				on_attach = require("emrhnpla.lsp.handlers").on_attach,
				capabilities = require("emrhnpla.lsp.handlers").capabilities,
				settings = {
					["rust-analyzer"] = {
						lens = {
							enable = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		})

		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
