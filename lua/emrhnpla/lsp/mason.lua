local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"dockerls",
	"emmet_ls",
	"html",
	"jsonls",
	"sumneko_lua",
	"omnisharp",
	"rust_analyzer",
	"tailwindcss",
	"taplo",
	"tsserver",
	"volar",
	"yamlls",
	"zk",
}

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

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

		local rust_tools_opts = require("emrhnpla.lsp.settings.rust-tools")

		rust_tools.setup(rust_tools_opts)

		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
