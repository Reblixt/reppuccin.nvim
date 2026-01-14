local M = {}

function M.apply()
	local _O, _C, _U = O, C, U
	O = require("reppuccin").options
	C = require("reppuccin.palette").get_palette()
	U = require "reppuccin.utils.colors"

	C.none = "NONE"

	local dim_percentage = O.dim_inactive.percentage
	C.dim = O.dim_inactive.shade == "dark"
		and U.darken(C.base, dim_percentage, C.mantle)
		or U.lighten(C.mantle, dim_percentage, C.base)

	local theme = {}
	theme.editor = require("reppuccin.groups.editor").get()
	if vim.fn.has "nvim" == 1 then
		theme.editor = vim.tbl_deep_extend("force", theme.editor, require("reppuccin.groups.lsp").get())
	end

	theme.syntax = {}
	local syntax_modules = { "syntax" }
	if vim.fn.has "nvim" == 1 then
		table.insert(syntax_modules, "semantic_tokens")
		table.insert(syntax_modules, "treesitter")
	end
	for i = 1, #syntax_modules do
		theme.syntax =
			vim.tbl_deep_extend("force", theme.syntax, require("reppuccin.groups." .. syntax_modules[i]).get())
	end

	local final_integrations = {}

	for integration in pairs(O.integrations) do
		local cot = false
		if type(O.integrations[integration]) == "table" then
			if O.integrations[integration].enabled == true then cot = true end
		else
			if O.integrations[integration] == true then
				local default = require("reppuccin").default_options.integrations[integration]
				O.integrations[integration] = type(default) == "table" and default or {}
				O.integrations[integration].enabled = true
				cot = true
			end
		end

		local ok, result = pcall(require, "reppuccin.groups.integrations." .. integration)
		if ok and result.get and cot then
			final_integrations = vim.tbl_deep_extend("force", final_integrations, result.get())
		end
	end

	theme.integrations = final_integrations
	theme.terminal = require("reppuccin.groups.terminal").get()
	local user_highlights = O.highlight_overrides

	if type(user_highlights.reppuccin) == "function" then
		user_highlights.reppuccin = user_highlights.reppuccin(C)
	end

	theme.custom_highlights = vim.tbl_deep_extend(
		"keep",
		user_highlights.reppuccin or {},
		type(user_highlights.all) == "function" and user_highlights.all(C) or user_highlights.all or {}
	)

	O, C, U = _O, _C, _U

	return theme
end

return M
