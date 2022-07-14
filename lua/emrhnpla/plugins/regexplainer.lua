local status_ok, regexplainer = pcall(require, "regexplainer")
if not status_ok then
	return
end

regexplainer.setup({
	mode = "narrative",
	auto = false,
	debug = false,
	display = "popup",
	narrative = {
		separator = "\n",
	},
})
