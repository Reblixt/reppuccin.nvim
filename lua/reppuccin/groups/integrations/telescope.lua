local M = {}

function M.get()
	return {
		TelescopeSelection = { fg = C.text, bg = C.surface1, style = { "bold" } },
		TelescopeSelectionCaret = { fg = C.peach, bg = C.surface1 },
		TelescopeMultiSelection = { fg = C.text, bg = C.surface1, style = { "bold" } },
		TelescopeNormal = { fg = C.text, bg = C.base },
		TelescopeBorder = { fg = C.blue, bg = C.base },
		TelescopePromptBorder = { fg = C.blue, bg = C.base },
		TelescopeResultsBorder = { fg = C.blue, bg = C.base },
		TelescopePreviewBorder = { fg = C.blue, bg = C.base },
		TelescopeMatching = { fg = C.peach, style = { "bold" } },
		TelescopePromptPrefix = { fg = C.peach },
		TelescopePrompt = { fg = C.text },
		TelescopeResultsTitle = { fg = C.blue, bg = C.base, style = { "bold" } },
		TelescopePromptTitle = { fg = C.blue, bg = C.base, style = { "bold" } },
		TelescopePreviewTitle = { fg = C.blue, bg = C.base, style = { "bold" } },
		TelescopePreviewNormal = { fg = C.text, bg = C.base },
		TelescopePreviewLine = { bg = C.surface1 },
		TelescopePreviewMatch = { fg = C.peach, style = { "bold" } },
		TelescopeResultsDiffAdd = { fg = C.green },
		TelescopeResultsDiffChange = { fg = C.peach },
		TelescopeResultsDiffDelete = { fg = C.error },
		TelescopeResultsDiffUntracked = { fg = C.overlay0 },
	}
end

return M
