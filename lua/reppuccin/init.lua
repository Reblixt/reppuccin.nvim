---@type Reppuccin
local M = {
	default_options = {
		compile_path = vim.fn.stdpath "cache" .. "/reppuccin",
		transparent_background = false,
		float = {
			transparent = false,
		},
		show_end_of_buffer = false,
		term_colors = false,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false,
		no_bold = false,
		no_underline = false,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		lsp_styles = {
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		default_integrations = true,
		integrations = {
			telescope = true,
			nvimtree = true,
			gitsigns = true,
			cmp = true,
			blink = true,
			indent_blankline = true,
			illuminate = true,
			bufferline = true,
			notify = true,
			supermaven = true,
			mini = true,
			lualine = true,
		},
		color_overrides = {},
		highlight_overrides = {},
	},
	path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
}

M.options = M.default_options

function M.compile()
	require("reppuccin.lib.compiler").compile()
end

local did_setup = false

function M.load()
	if not did_setup then M.setup() end
	local compiled_path = M.options.compile_path .. M.path_sep .. "reppuccin"
	local f = loadfile(compiled_path)
	if not f then
		M.compile()
		f = assert(loadfile(compiled_path), "could not load cache")
	end
	f()
end

---@type fun(user_conf: ReppuccinOptions?)
function M.setup(user_conf)
	did_setup = true
	
	user_conf = user_conf or {}

	if user_conf.default_integrations == false then
		M.default_options.integrations = {}
	end

	M.options = vim.tbl_deep_extend("keep", user_conf, M.default_options)
	M.options.highlight_overrides.all = user_conf.custom_highlights or M.options.highlight_overrides.all

	M.compile()
end

vim.api.nvim_create_user_command("ReppuccinCompile", function()
	for name, _ in pairs(package.loaded) do
		if name:match "^reppuccin." then package.loaded[name] = nil end
	end
	M.compile()
	vim.notify("Reppuccin (info): compiled cache!", vim.log.levels.INFO)
	vim.cmd.colorscheme "reppuccin"
end, {})

if vim.g.reppuccin_debug then
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*/reppuccin/*",
		callback = function()
			vim.schedule(function() vim.cmd "ReppuccinCompile" end)
		end,
	})
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "reppuccin",
	callback = function()
		local O = require("reppuccin").options
		if O.integrations.lualine then
			pcall(require("reppuccin.special.lualine").apply)
		end
	end,
})

return M
