local M = {}

function M.get()
	return {
		BufferLineFill = { fg = C.overlay0, bg = C.base },
		BufferLineBackground = { fg = C.overlay0, bg = C.base },
		BufferLineBufferVisible = { fg = C.text, bg = C.base },
		BufferLineBufferSelected = { fg = C.text, bg = C.mantle, style = { "bold" } },
		BufferLineTab = { fg = C.overlay0, bg = C.base },
		BufferLineTabSelected = { fg = C.text, bg = C.mantle, style = { "bold" } },
		BufferLineTabClose = { fg = C.error, bg = C.base },
		BufferLineSeparator = { fg = C.surface0, bg = C.base },
		BufferLineSeparatorVisible = { fg = C.surface0, bg = C.base },
		BufferLineSeparatorSelected = { fg = C.surface0, bg = C.mantle },
		BufferLineIndicatorSelected = { fg = C.blue, bg = C.mantle },
		BufferLineModified = { fg = C.peach, bg = C.base },
		BufferLineModifiedVisible = { fg = C.peach, bg = C.base },
		BufferLineModifiedSelected = { fg = C.peach, bg = C.mantle, style = { "bold" } },
		BufferLineError = { fg = C.error, bg = C.base },
		BufferLineErrorVisible = { fg = C.error, bg = C.base },
		BufferLineErrorSelected = { fg = C.error, bg = C.mantle },
		BufferLineWarning = { fg = C.warning, bg = C.base },
		BufferLineWarningVisible = { fg = C.warning, bg = C.base },
		BufferLineWarningSelected = { fg = C.warning, bg = C.mantle },
		BufferLineInfo = { fg = C.info, bg = C.base },
		BufferLineInfoVisible = { fg = C.info, bg = C.base },
		BufferLineInfoSelected = { fg = C.info, bg = C.mantle },
		BufferLineHint = { fg = C.hint, bg = C.base },
		BufferLineHintVisible = { fg = C.hint, bg = C.base },
		BufferLineHintSelected = { fg = C.hint, bg = C.mantle },
	}
end

return M
