local M = {}

function M.get()
	return {
		NvimTreeNormal = { fg = C.text, bg = C.base },
		NvimTreeNormalNC = { fg = C.text, bg = C.base },
		NvimTreeRootFolder = { fg = C.peach, style = { "bold" } },
		NvimTreeFolderIcon = { fg = C.blue },
		NvimTreeFolderName = { fg = C.blue },
		NvimTreeEmptyFolderName = { fg = C.overlay0 },
		NvimTreeOpenedFolderName = { fg = C.blue },
		NvimTreeIndentMarker = { fg = C.overlay0 },
		NvimTreeSymlink = { fg = C.mauve },
		NvimTreeSpecialFile = { fg = C.peach },
		NvimTreeFileDeleted = { fg = C.error },
		NvimTreeFileDirty = { fg = C.warning },
		NvimTreeFileStaged = { fg = C.green },
		NvimTreeFileMerge = { fg = C.mauve },
		NvimTreeFileRenamed = { fg = C.orange },
		NvimTreeFileNew = { fg = C.green },
		NvimTreeGitDeleted = { fg = C.error },
		NvimTreeGitDirty = { fg = C.warning },
		NvimTreeGitStaged = { fg = C.green },
		NvimTreeGitMerge = { fg = C.mauve },
		NvimTreeGitRenamed = { fg = C.orange },
		NvimTreeGitNew = { fg = C.green },
		NvimTreeWinSeparator = { fg = C.surface0, bg = C.base },
		NvimTreeCursorLine = { bg = C.surface1 },
		NvimTreeCursor = { bg = C.surface1 },
	}
end

return M
