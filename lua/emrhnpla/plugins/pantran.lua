local status_ok, pantran = pcall(require, "pantran")
if not status_ok then
	return
end

pantran.setup({
	engines = {
		default_engine = "argos",
		yandex = {
			default_source = "auto",
			default_target = "en",
		},
	},
	controls = {
		mappings = {
			edit = {
				n = {
					["j"] = "gj",
					["k"] = "gk",
				},
			},
		},
	},
})
