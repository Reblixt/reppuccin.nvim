local M = {}

function M.get()
	return {
		IndentBlanklineChar = { fg = "#2a2e38", nocombine = true },
		IndentBlanklineContextChar = { fg = "#7e9cd8", nocombine = true },
		IndentBlanklineContextStart = { fg = "#7e9cd8", style = { "bold" } },
		IndentBlanklineSpaceChar = { fg = "#2a2e38", nocombine = true },
		IndentBlanklineSpaceCharBlankline = { fg = "#2a2e38", nocombine = true },
	}
end

return M
