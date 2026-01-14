local M = {}

function M.get()
	return {
		GitSignsAdd = { fg = C.green },
		GitSignsChange = { fg = C.peach },
		GitSignsDelete = { fg = C.error },
		GitSignsAddNr = { fg = C.green },
		GitSignsChangeNr = { fg = C.peach },
		GitSignsDeleteNr = { fg = C.error },
		GitSignsAddLn = { fg = C.green },
		GitSignsChangeLn = { fg = C.peach },
		GitSignsDeleteLn = { fg = C.error },
		GitSignsCurrentLineBlame = { fg = C.overlay0, style = { "italic" } },
	}
end

return M
