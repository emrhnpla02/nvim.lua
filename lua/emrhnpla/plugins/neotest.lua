local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
		}),
		require("neotest-vim-test")({
			ignore_file_types = { "javascript", "javascriptreact" },
		}),
	},
})
