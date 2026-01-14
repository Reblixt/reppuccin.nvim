local M = {}

function M.get()
	local colors = {
		["@variable"] = { fg = C.text, style = O.styles.variables or {} },
		["@variable.builtin"] = { fg = C.text, style = O.styles.properties or {} },
		["@variable.parameter"] = { fg = C.error, style = { "italic" } },
		["@variable.member"] = { fg = C.error },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = C.orange, style = O.styles.keywords or {} },
		["@constant.macro"] = { link = "Macro" },

		["@module"] = { fg = C.error, style = O.styles.miscs or { "italic" } },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.documentation"] = { fg = C.green, style = O.styles.strings or {} },
		["@string.regexp"] = { fg = C.green },
		["@string.escape"] = { fg = C.peach, style = { "bold" } },
		["@string.special"] = { link = "Special" },
		["@string.special.path"] = { link = "Special" },
		["@string.special.symbol"] = { fg = C.blue },
		["@string.special.url"] = { fg = C.blue, style = { "italic", "underline" } },
		["@punctuation.delimiter.regex"] = { link = "@string.regexp" },

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = C.peach, style = O.styles.properties or { "italic" } },
		["@type.definition"] = { link = "Type" },

		["@attribute"] = { link = "Constant" },
		["@property"] = { fg = C.error, style = O.styles.properties or {} },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = C.blue, style = { "bold" } },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { fg = C.error, style = { "bold" } },

		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },

		["@constructor"] = { fg = C.peach },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.modifier"] = { link = "Keyword" },
		["@keyword.type"] = { link = "Keyword" },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.function"] = { fg = C.mauve, style = O.styles.keywords or {} },
		["@keyword.operator"] = { fg = C.text },
		["@keyword.import"] = { fg = C.blue, style = { "italic" } },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.return"] = { fg = C.mauve, style = O.styles.keywords or {} },
		["@keyword.debug"] = { link = "Exception" },
		["@keyword.exception"] = { link = "Exception" },

		["@keyword.conditional"] = { link = "Conditional" },
		["@keyword.conditional.ternary"] = { link = "Operator" },

		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },

		["@keyword.export"] = { fg = C.mauve, style = O.styles.keywords },

		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { fg = C.text },
		["@punctuation.special"] = { link = "Special" },

		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },

		["@comment.error"] = { fg = C.base, bg = C.error },
		["@comment.warning"] = { fg = C.base, bg = C.warning },
		["@comment.hint"] = { fg = C.base, bg = C.blue },
		["@comment.todo"] = { fg = C.base, bg = C.pink },
		["@comment.note"] = { fg = C.base, bg = C.text },

		["@markup"] = { fg = C.text },
		["@markup.strong"] = { fg = C.text, style = { "bold" } },
		["@markup.italic"] = { fg = C.text, style = { "italic" } },
		["@markup.strikethrough"] = { fg = C.error, style = { "strikethrough" } },
		["@markup.underline"] = { link = "Underlined" },

		["@markup.heading"] = { fg = C.peach, style = { "bold" } },
		["@markup.heading.markdown"] = { style = { "bold" } },

		["@markup.math"] = { fg = C.blue },
		["@markup.quote"] = { fg = "#565f89", style = { "italic" } },
		["@markup.environment"] = { fg = C.blue },
		["@markup.environment.name"] = { fg = C.blue },

		["@markup.link"] = { fg = C.blue, style = { "underline" } },
		["@markup.link.label"] = { fg = C.blue },
		["@markup.link.url"] = { fg = C.blue, style = { "italic", "underline" } },

		["@markup.raw"] = { fg = C.green },

		["@markup.list"] = { fg = C.peach },
		["@markup.list.checked"] = { fg = C.green },
		["@markup.list.unchecked"] = { fg = C.overlay1 },

		["@diff.plus"] = { link = "diffAdded" },
		["@diff.minus"] = { link = "diffRemoved" },
		["@diff.delta"] = { link = "diffChanged" },

		["@tag"] = { fg = C.peach },
		["@tag.builtin"] = { fg = C.sky },
		["@tag.attribute"] = { fg = C.blue },
		["@tag.delimiter"] = { fg = "#9aa5ce" },

		["@error"] = { link = "Error" },

		["@function.builtin.bash"] = { fg = C.error, style = O.styles.miscs or { "italic" } },
		["@variable.parameter.bash"] = { fg = C.green },

		["@markup.heading.1.markdown"] = { link = "rainbow1" },
		["@markup.heading.2.markdown"] = { link = "rainbow2" },
		["@markup.heading.3.markdown"] = { link = "rainbow3" },
		["@markup.heading.4.markdown"] = { link = "rainbow4" },
		["@markup.heading.5.markdown"] = { link = "rainbow5" },
		["@markup.heading.6.markdown"] = { link = "rainbow6" },

		["@markup.heading.html"] = { link = "@markup" },
		["@markup.heading.1.html"] = { link = "@markup" },
		["@markup.heading.2.html"] = { link = "@markup" },
		["@markup.heading.3.html"] = { link = "@markup" },
		["@markup.heading.4.html"] = { link = "@markup" },
		["@markup.heading.5.html"] = { link = "@markup" },
		["@markup.heading.6.html"] = { link = "@markup" },

		["@constant.java"] = { fg = C.sky },

		["@property.css"] = { fg = C.blue },
		["@property.scss"] = { fg = C.blue },
		["@property.id.css"] = { fg = C.peach },
		["@property.class.css"] = { fg = C.peach },
		["@type.css"] = { fg = C.blue },
		["@type.tag.css"] = { fg = C.blue },
		["@string.plain.css"] = { fg = C.text },
		["@number.css"] = { fg = C.orange },
		["@keyword.directive.css"] = { link = "Keyword" },

		["@string.special.url.html"] = { fg = C.green },
		["@markup.link.label.html"] = { fg = C.text },
		["@character.special.html"] = { fg = C.error },

		["@constructor.lua"] = { link = "@punctuation.bracket" },

		["@constructor.python"] = { fg = C.blue },

		["@label.yaml"] = { fg = C.peach },

		["@string.special.symbol.ruby"] = { fg = C.pink },

		["@function.method.php"] = { link = "Function" },
		["@function.method.call.php"] = { link = "Function" },

		["@keyword.import.c"] = { fg = C.peach },
		["@keyword.import.cpp"] = { fg = C.peach },

		["@attribute.c_sharp"] = { fg = C.peach },

		["@comment.warning.gitcommit"] = { fg = C.warning },

		["@string.special.path.gitignore"] = { fg = C.text },

		gitcommitSummary = { fg = C.text, style = O.styles.miscs or { "italic" } },
		zshKSHFunction = { link = "Function" },
	}

	colors["@parameter"] = colors["@variable.parameter"]
	colors["@field"] = colors["@variable.member"]
	colors["@namespace"] = colors["@module"]
	colors["@float"] = colors["@number.float"]
	colors["@symbol"] = colors["@string.special.symbol"]
	colors["@string.regex"] = colors["@string.regexp"]

	colors["@text"] = colors["@markup"]
	colors["@text.strong"] = colors["@markup.strong"]
	colors["@text.emphasis"] = colors["@markup.italic"]
	colors["@text.underline"] = colors["@markup.underline"]
	colors["@text.strike"] = colors["@markup.strikethrough"]
	colors["@text.uri"] = colors["@markup.link.url"]
	colors["@text.math"] = colors["@markup.math"]
	colors["@text.environment"] = colors["@markup.environment"]
	colors["@text.environment.name"] = colors["@markup.environment.name"]

	colors["@text.title"] = colors["@markup.heading"]
	colors["@text.literal"] = colors["@markup.raw"]
	colors["@text.reference"] = colors["@markup.link"]

	colors["@text.todo.checked"] = colors["@markup.list.checked"]
	colors["@text.todo.unchecked"] = colors["@markup.list.unchecked"]

	colors["@comment.note"] = colors["@comment.hint"]

	colors["@text.todo"] = colors["@comment.todo"]
	colors["@text.warning"] = colors["@comment.warning"]
	colors["@text.note"] = colors["@comment.note"]
	colors["@text.danger"] = colors["@comment.error"]

	colors["@method"] = colors["@function.method"]
	colors["@method.call"] = colors["@function.method.call"]

	colors["@text.diff.add"] = colors["@diff.plus"]
	colors["@text.diff.delete"] = colors["@diff.minus"]

	colors["@type.qualifier"] = colors["@keyword.modifier"]
	colors["@keyword.storage"] = colors["@keyword.modifier"]
	colors["@define"] = colors["@keyword.directive.define"]
	colors["@preproc"] = colors["@keyword.directive"]
	colors["@storageclass"] = colors["@keyword.storage"]
	colors["@conditional"] = colors["@keyword.conditional"]
	colors["@exception"] = colors["@keyword.exception"]
	colors["@include"] = colors["@keyword.import"]
	colors["@repeat"] = colors["@keyword.repeat"]

	colors["@symbol.ruby"] = colors["@string.special.symbol.ruby"]

	colors["@variable.member.yaml"] = colors["@field.yaml"]

	colors["@text.title.1.markdown"] = colors["@markup.heading.1.markdown"]
	colors["@text.title.2.markdown"] = colors["@markup.heading.2.markdown"]
	colors["@text.title.3.markdown"] = colors["@markup.heading.3.markdown"]
	colors["@text.title.4.markdown"] = colors["@markup.heading.4.markdown"]
	colors["@text.title.5.markdown"] = colors["@markup.heading.5.markdown"]
	colors["@text.title.6.markdown"] = colors["@markup.heading.6.markdown"]

	colors["@method.php"] = colors["@function.method.php"]
	colors["@method.call.php"] = colors["@function.method.call.php"]

	return colors
end

return M
