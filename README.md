# Reppuccin.nvim

> Forked by [catppuccin.nvim](https://github.com/catppuccin/nvim) 
> Inspired by NvChad's Catppuccin theme


## Requirements

- Neovim >= 0.8

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
	"reblixt/reppuccin.nvim",
	name = "reppuccin",
	priority = 1000,
	config = function()
		require("reppuccin").setup()
	end,
}
```

## Usage

Enable the colorscheme:

```vim
colorscheme reppuccin
```

## Configuration

Reppuccin.nvim can be configured by passing a table to the `setup()` function:

```lua
require("reppuccin").setup({
	transparent_background = false,
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
	},
	color_overrides = {},
	custom_highlights = {},
})
```

### Options

| Option | Type | Default | Description |
|--------|------|----------|-------------|
| `compile_path` | string | `vim.fn.stdpath "cache" .. "/reppuccin"` | Path where the compiled theme will be stored |
| `transparent_background` | boolean | `false` | Enable transparent background |
| `float.transparent` | boolean | `false` | Enable transparent background for floating windows |
| `show_end_of_buffer` | boolean | `false` | Show "~" characters after the end of buffer |
| `term_colors` | boolean | `false` | Enable terminal colors |
| `dim_inactive` | table | see config | Dim inactive windows |
| `no_italic` | boolean | `false` | Disable italic styles |
| `no_bold` | boolean | `false` | Disable bold styles |
| `no_underline` | boolean | `false` | Disable underline styles |
| `styles` | table | see config | Define styles for different syntax groups |
| `integrations` | table | see config | Enable/disable plugin integrations |
| `color_overrides` | table | `{}` | Override specific colors |
| `custom_highlights` | table | `{}` | Add custom highlight groups |

### Color Overrides

You can override any color in the palette:

```lua
require("reppuccin").setup({
	color_overrides = {
		base = "#1e1e2e",
		mantle = "#181825",
		text = "#cdd6f4",
	}
})
```

### Custom Highlights

You can add custom highlight groups or override existing ones:

```lua
require("reppuccin").setup({
	custom_highlights = {
		Normal = { fg = "#ffffff", bg = "#000000" },
		MyCustomGroup = { fg = C.blue, style = { "bold", "italic" } },
	},
})
```

## Integrations

Reppuccin.nvim supports the following plugins:

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [vim-illuminate](https://github.com/ellisonleao/vim-illuminate)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)

Disable specific integrations:

```lua
require("reppuccin").setup({
	integrations = {
		telescope = false,
		bufferline = false,
	},
})
```

## LSP

Reppuccin.nvim provides comprehensive LSP support, including:
- Diagnostics (errors, warnings, hints, information)
- Semantic tokens
- Inlay hints
- Code lens
- Signature help

## Terminal Colors

Enable terminal colors for consistency between your editor and terminal:

```lua
require("reppuccin").setup({
	term_colors = true,
})
```

## Transparent Background

Enable transparent background for a floating window look:

```lua
require("reppuccin").setup({
	transparent_background = true,
	float = {
		transparent = true,
	},
})
```

## Compilation

The theme is compiled to bytecode for fast loading. You can manually recompile the theme using:

```vim
:ReppuccinCompile
```

## Debugging

Enable debug mode to automatically recompile when saving theme files:

```vim
let g:reppuccin_debug = 1
```

## Credits

<!-- - Original theme: [Reblixt](https://github.com/Reblixt) -->
- Inspiration: [catppuccin.nvim](https://github.com/catppuccin/nvim)
- Inspiration: [NvChad](https://github.com/NvChad/NvChad)
