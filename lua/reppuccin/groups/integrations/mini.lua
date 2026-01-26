local M = {}

function M.get()
	return {
		-- Modes
		MiniStatuslineModeOther = { fg = C.text, bg = C.base },
		MiniStatuslineModeNormal = { fg = C.base, bg = C.blue },
		MiniStatuslineModeInsert = { fg = C.base, bg = C.green },
		MiniStatuslineModeVisual = { fg = C.base, bg = C.peach },
		MiniStatuslineModeCommand = { fg = C.text, bg = C.red },
		MiniStatuslineModeReplace = { fg = C.text, bg = C.mauve },
		-- Others
		MiniStatuslineFilename = { fg = C.text, bg = C.base },
		MiniStatuslineFileinfo = { fg = C.text, bg = C.base },
		MiniStatuslineDevinfo = { fg = C.base, bg = C.sky },
		MiniStatuslineInactive = { fg = C.overlay1, bg = C.surface0 },
	}
end

return M
