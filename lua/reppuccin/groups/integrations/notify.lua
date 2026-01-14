local M = {}

function M.get()
	return {
		NotifyERRORBorder = { fg = C.error },
		NotifyWARNBorder = { fg = C.warning },
		NotifyINFOBorder = { fg = C.info },
		NotifyDEBUGBorder = { fg = C.overlay0 },
		NotifyTRACEBorder = { fg = C.mauve },
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
		NotifyERRORBody = { fg = C.text },
		NotifyWARNBody = { fg = C.text },
		NotifyINFOBody = { fg = C.text },
		NotifyDEBUGBody = { fg = C.text },
		NotifyTRACEBody = { fg = C.text },
	}
end

return M
