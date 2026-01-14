local M = {}

function M.get()
	return {
		NotifyBackground = { bg = C.base },
		NotifyERRORBorder = { fg = C.error, bg = C.base },
		NotifyWARNBorder = { fg = C.warning, bg = C.base },
		NotifyINFOBorder = { fg = C.info, bg = C.base },
		NotifyDEBUGBorder = { fg = C.overlay0, bg = C.base },
		NotifyTRACEBorder = { fg = C.mauve, bg = C.base },
		NotifyERRORIcon = { fg = C.error },
		NotifyWARNIcon = { fg = C.warning },
		NotifyINFOIcon = { fg = C.info },
		NotifyDEBUGIcon = { fg = C.overlay0 },
		NotifyTRACEIcon = { fg = C.mauve },
		NotifyERRORTitle = { fg = C.error, style = { "bold" } },
		NotifyWARNTitle = { fg = C.warning, style = { "bold" } },
		NotifyINFOTitle = { fg = C.info, style = { "bold" } },
		NotifyDEBUGTitle = { fg = C.overlay0, style = { "bold" } },
		NotifyTRACETitle = { fg = C.mauve, style = { "bold" } },
		NotifyERRORBody = { fg = C.text, bg = C.base },
		NotifyWARNBody = { fg = C.text, bg = C.base },
		NotifyINFOBody = { fg = C.text, bg = C.base },
		NotifyDEBUGBody = { fg = C.text, bg = C.base },
		NotifyTRACEBody = { fg = C.text, bg = C.base },
	}
end

return M
