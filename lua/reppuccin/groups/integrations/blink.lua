local M = {}

function M.get()
	return {
		BlinkCmpMenu = { fg = C.text, bg = C.mantle },
		BlinkCmpMenuBorder = { fg = C.blue, bg = C.mantle },
		BlinkCmpMenuSelection = { fg = C.text, bg = C.surface1 },
		BlinkCmpLabel = { fg = C.text },
		BlinkCmpLabelMatch = { fg = C.blue, style = { "bold" } },
		BlinkCmpLabelDescription = { fg = C.overlay0 },
		BlinkCmpKind = { fg = C.peach },
		BlinkCmpKindIcon = { fg = C.peach },
		BlinkCmpKindKeyword = { fg = C.mauve },
		BlinkCmpKindVariable = { fg = C.text },
		BlinkCmpKindFunction = { fg = C.blue },
		BlinkCmpKindMethod = { fg = C.mauve },
		BlinkCmpKindConstructor = { fg = C.peach },
		BlinkCmpKindClass = { fg = C.peach },
		BlinkCmpKindInterface = { fg = C.peach },
		BlinkCmpKindModule = { fg = C.error },
		BlinkCmpKindProperty = { fg = C.error },
		BlinkCmpKindField = { fg = C.error },
		BlinkCmpKindEnum = { fg = C.peach },
		BlinkCmpKindEnumMember = { fg = C.orange },
		BlinkCmpKindConstant = { fg = C.orange },
		BlinkCmpKindStruct = { fg = C.peach },
		BlinkCmpKindEvent = { fg = C.peach },
		BlinkCmpKindOperator = { fg = C.text },
		BlinkCmpKindTypeParameter = { fg = C.peach },
		BlinkCmpKindUnit = { fg = C.orange },
		BlinkCmpKindValue = { fg = C.orange },
		BlinkCmpKindText = { fg = C.text },
		BlinkCmpKindSnippet = { fg = C.green },
		BlinkCmpKindColor = { fg = C.blue },
		BlinkCmpKindFile = { fg = C.blue },
		BlinkCmpKindReference = { fg = C.text },
		BlinkCmpKindFolder = { fg = C.blue },
		BlinkCmpGhostText = { fg = C.overlay0, style = { "italic" } },
	}
end

return M
