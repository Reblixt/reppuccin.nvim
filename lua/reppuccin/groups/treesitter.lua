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
		["@keyword.operator"] = { fg = C.mauve },
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
		["@punctuation.bracket"] = { fg = C.orange },
		["@punctuation.special"] = { link = "Special" },

		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },

		["@comment.error"] = { fg = C.base, bg = C.error },
		["@comment.warning"] = { fg = C.base, bg = C.warning },
		["@comment.hint"] = { fg = C.base, bg = C.blue },
		["@comment.todo"] = { fg = C.base, bg = C.pink },
		["@comment.note"] = { fg = C.base, bg = C.text },

		["@unused"] = { fg = C.unused },
		["@function.unused"] = { fg = C.unused },
		["@variable.unused"] = { fg = C.unused },
		["@type.unused"] = { fg = C.unused },
		["@method.unused"] = { fg = C.unused },
		["@property.unused"] = { fg = C.unused },
		["@parameter.unused"] = { fg = C.unused },
		["@constant.unused"] = { fg = C.unused },
		["@module.unused"] = { fg = C.unused },

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
		["@variable.parameter.bash"] = { fg = C.red },

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

		typescriptBlock = { fg = C.red },
		typescriptVariable = { fg = C.mauve },
		typescriptExport = { fg = C.mauve },
		typescriptClassBlock = { fg = C.yellow },
		typescriptIdentifierName = { fg = C.orange },
		typescriptLabel = { fg = C.mauve },
		typescriptObjectLabel = { fg = C.mauve },
		typescriptPropertySignature = { fg = C.sky },
		typescriptProp = { fg = C.red },
		typescriptParens = { fg = C.mauve },
		typescriptCallSignature = { fg = C.peach },
		typescriptParameter = { fg = C.red },
		typescriptDestructureVariable = { fg = C.green },
		typescriptObjectType = { fg = C.peach },
		typescriptAliasDeclaration = { fg = C.yellow },
		typescriptAliasKeyword = { fg = C.mauve },
		typescriptAbstract = { fg = C.mauve },
		typescriptReadonly = { fg = C.mauve },
		typescriptModuleKeyword = { fg = C.mauve },
		typescriptImportConstraint = { fg = C.mauve },
		typescriptAsKeyword = { fg = C.mauve },
		typescriptAssertKeyword = { fg = C.mauve },
		typescriptCaseKeyword = { fg = C.mauve },
		typescriptDeleteKeyword = { fg = C.mauve },
		typescriptVoidKeyword = { fg = C.mauve },
		typescriptTypeOperator = { fg = C.sky },
		typescriptDeclareKeyword = { fg = C.mauve },
		typescriptPrefixed = { fg = C.error },

		["@keyword.typescript"] = { link = "Keyword" },
		["@keyword.function.typescript"] = { fg = C.mauve, style = O.styles.keywords or {} },
		["@type.typescript"] = { fg = C.yellow },
		["@type.builtin.typescript"] = { fg = C.peach, style = O.styles.properties or { "italic" } },
		["@variable.typescript"] = { fg = C.text, style = O.styles.variables or {} },
		["@variable.parameter.typescript"] = { fg = C.red, style = { "italic" } },
		["@function.typescript"] = { link = "Function" },
		["@function.call.typescript"] = { link = "Function" },
		["@function.method.typescript"] = { link = "Function" },
		["@function.method.call.typescript"] = { link = "Function" },
		["@constructor.typescript"] = { fg = C.yellow },
		["@operator.typescript"] = { fg = C.sky },
		["@string.typescript"] = { link = "String" },
		["@number.typescript"] = { link = "Number" },
		["@boolean.typescript"] = { link = "Boolean" },
		["@comment.typescript"] = { link = "Comment" },
		["@punctuation.delimiter.typescript"] = { link = "Delimiter" },
		["@property.typescript"] = { fg = C.error, style = O.styles.properties or {} },

		rustCommentLine = { link = "Comment" },
		rustCommentLineDoc = { link = "Comment" },
		rustCommentBlock = { link = "Comment" },
		rustCommentBlockDoc = { link = "Comment" },
		rustIdentifier = { fg = C.text },
		rustLifetime = { fg = C.orange },
		rustLabel = { fg = C.mauve },
		rustMacro = { fg = C.blue },
		rustAttribute = { fg = C.peach },
		rustDeriveTrait = { fg = C.pink },
		rustBuiltinType = { fg = C.peach },
		rustFoldBraces = { fg = C.mauve },

		["@keyword.rust"] = { link = "Keyword" },
		["@keyword.function.rust"] = { fg = C.mauve, style = O.styles.keywords or {} },
		["@type.rust"] = { fg = C.yellow },
		["@type.builtin.rust"] = { fg = C.peach, style = O.styles.properties or { "italic" } },
		["@variable.rust"] = { fg = C.text, style = O.styles.variables or {} },
		["@variable.parameter.rust"] = { fg = C.red, style = { "italic" } },
		["@variable.builtin.rust"] = { fg = C.text, style = O.styles.properties or {} },
		["@function.rust"] = { link = "Function" },
		["@function.call.rust"] = { link = "Function" },
		["@function.method.rust"] = { link = "Function" },
		["@function.method.call.rust"] = { link = "Function" },
		["@function.builtin.rust"] = { fg = C.blue, style = { "bold" } },
		["@attribute.rust"] = { link = "Constant" },
		["@macro.rust"] = { fg = C.red },
		["@operator.rust"] = { link = "Operator" },
		["@string.rust"] = { link = "String" },
		["@number.rust"] = { link = "Number" },
		["@boolean.rust"] = { link = "Boolean" },
		["@comment.rust"] = { link = "Comment" },
		["@punctuation.delimiter.rust"] = { link = "Delimiter" },
		["@property.rust"] = { fg = C.error, style = O.styles.properties or {} },

		["@keyword.prisma"] = { link = "Keyword" },
		["@type.prisma"] = { fg = C.peach, style = O.styles.types or {} },
		["@type.builtin.prisma"] = { fg = C.blue },
		["@attribute.prisma"] = { fg = C.blue },
		["@property.prisma"] = { fg = C.text },
		["@string.prisma"] = { link = "String" },
		["@comment.prisma"] = { link = "Comment" },
		["@number.prisma"] = { link = "Number" },
		["@boolean.prisma"] = { link = "Boolean" },
		["@operator.prisma"] = { link = "Operator" },
		["@punctuation.delimiter.prisma"] = { link = "Delimiter" },
		["@constructor.prisma"] = { fg = C.mauve },

		solEvent = { fg = C.mauve },
		solContract = { fg = C.mauve },
		solBuiltinType = { fg = C.blue },
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
