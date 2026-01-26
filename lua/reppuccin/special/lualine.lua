local M = {}

function M.get()
	local C = require("reppuccin.palette").get_palette()
	local O = require("reppuccin").options

	local transparent_bg = O.transparent_background and "NONE" or C.mantle

	local theme = {
		normal = {
			a = { bg = C.blue, fg = C.mantle, gui = "bold" },
			b = { bg = C.surface0, fg = C.blue },
			c = { bg = transparent_bg, fg = C.text },
			x = { bg = transparent_bg, fg = C.blue },
			y = { bg = C.surface0, fg = C.text, gui = "bold" },
			z = { bg = C.blue, fg = C.mantle },
		},
		insert = {
			a = { bg = C.green, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.green },
			c = { bg = transparent_bg, fg = C.text },
			x = { bg = transparent_bg, fg = C.green },
			y = { bg = C.surface0, fg = C.text, gui = "bold" },
			z = { bg = C.green, fg = C.base },
		},
		visual = {
			a = { bg = C.mauve, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.mauve },
			c = { bg = transparent_bg, fg = C.text },
			x = { bg = transparent_bg, fg = C.mauve },
			y = { bg = C.surface0, fg = C.text, gui = "bold" },
			z = { bg = C.mauve, fg = C.base },
		},
		replace = {
			a = { bg = C.red, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.red },
			c = { bg = transparent_bg, fg = C.text },
			x = { bg = transparent_bg, fg = C.red },
			y = { bg = C.surface0, fg = C.text, gui = "bold" },
			z = { bg = C.red, fg = C.base },
		},
		command = {
			a = { bg = C.peach, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.peach },
			c = { bg = transparent_bg, fg = C.text },
			x = { bg = transparent_bg, fg = C.peach },
			y = { bg = C.surface0, fg = C.text, gui = "bold" },
			z = { bg = C.peach, fg = C.base },
		},
		terminal = {
			a = { bg = C.green, fg = C.base, gui = "bold" },
			b = { bg = C.surface0, fg = C.green },
			c = { bg = transparent_bg, fg = C.text },
			x = { bg = transparent_bg, fg = C.green },
			y = { bg = C.surface0, fg = C.text, gui = "bold" },
			z = { bg = C.green, fg = C.base },
		},
		inactive = {
			a = { bg = transparent_bg, fg = C.blue },
			b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
			c = { bg = transparent_bg, fg = C.overlay0 },
			x = { bg = transparent_bg, fg = C.overlay0 },
			y = { bg = transparent_bg, fg = C.overlay1, gui = "bold" },
			z = { bg = transparent_bg, fg = C.overlay0 },
		},
	}

	local lualine_overrides = O.integrations.lualine or {}
	if type(lualine_overrides) == "table" then
		for mode, mode_overrides in pairs(lualine_overrides) do
			if type(mode_overrides) == "table" then
				if theme[mode] then
					theme[mode] = vim.tbl_deep_extend("force", theme[mode], mode_overrides)
				else
					theme[mode] = mode_overrides
				end
			end
		end
	end

	return theme
end

function M.apply()
	local ok, lualine = pcall(require, "lualine")
	if not ok then
		return
	end

	local theme = M.get()

	local function do_setup()
		lualine.setup({ options = { theme = theme } })
		if lualine.refresh then
			lualine.refresh({ scope = "all", force = true })
		end
	end

	if not lualine.config then
		do_setup()
	else
		vim.schedule(do_setup)
	end
end

return M
