local M = {}

function M.get()
	return {
		CmpItemAbbr = { fg = C.text },
		CmpItemAbbrDeprecated = { fg = C.overlay0, style = { "strikethrough" } },
		CmpItemAbbrMatch = { fg = C.blue, style = { "bold" } },
		CmpItemAbbrMatchFuzzy = { fg = C.blue, style = { "bold" } },
		CmpItemKind = { fg = C.peach },
		CmpItemMenu = { fg = C.overlay0 },

		CmpItemKindText = { fg = C.text },
		CmpItemKindMethod = { fg = C.mauve },
		CmpItemKindFunction = { fg = C.blue },
		CmpItemKindConstructor = { fg = C.peach },
		CmpItemKindField = { fg = C.error },
		CmpItemKindVariable = { fg = C.text },
		CmpItemKindClass = { fg = C.peach },
		CmpItemKindInterface = { fg = C.peach },
		CmpItemKindModule = { fg = C.error },
		CmpItemKindProperty = { fg = C.error },
		CmpItemKindUnit = { fg = C.orange },
		CmpItemKindValue = { fg = C.orange },
		CmpItemKindEnum = { fg = C.peach },
		CmpItemKindKeyword = { fg = C.mauve },
		CmpItemKindSnippet = { fg = C.green },
		CmpItemKindColor = { fg = C.blue },
		CmpItemKindFile = { fg = C.blue },
		CmpItemKindReference = { fg = C.text },
		CmpItemKindFolder = { fg = C.blue },
		CmpItemKindEnumMember = { fg = C.orange },
		CmpItemKindConstant = { fg = C.orange },
		CmpItemKindStruct = { fg = C.peach },
		CmpItemKindEvent = { fg = C.peach },
		CmpItemKindOperator = { fg = C.text },
		CmpItemKindTypeParameter = { fg = C.peach },
	}
end

return M
