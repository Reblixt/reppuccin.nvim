# AGENTS.md - Reppuccin.nvim Development Guide

This document provides guidelines for agentic coding assistants working on reppuccin.nvim, a Neovim colorscheme plugin forked from catppuccin.nvim.

## Project Overview

Reppuccin.nvim is a single-flavor colorscheme that provides highlight groups for Neovim. The theme is compiled to bytecode for fast loading. The codebase follows catppuccin/nvim conventions with some modifications.

## Build, Lint, and Test Commands

### Compilation
```bash
# Compile the theme (generates bytecode cache)
:ReppuccinCompile

# Enable debug mode to auto-recompile on save
let g:reppuccin_debug = 1
```

### Manual Debugging
The compiled Lua source is written to the compile path when debug mode is enabled:
```bash
# Default compile path
vim.fn.stdpath "cache" .. "/reppuccin"
```

### No Formal Test Suite
This project has no automated tests. Manual verification is required:
1. Load the colorscheme with `:colorscheme reppuccin`
2. Check all highlight groups with `:Inspect`
3. Test with various plugins (telescope, cmp, lsp, etc.)

### No Linting
No formal linter is configured. Code should follow Lua best practices and Neovim API conventions.

## Code Style Guidelines

### General Principles
- Follow the existing code patterns exactly as found in the codebase
- No comments unless explicitly required (catppuccin style)
- Keep functions focused and single-purpose
- Use descriptive names for highlight group modules

### Indentation and Formatting
- Use 4 spaces for indentation (no tabs)
- Align table keys consistently
- Use trailing commas in table definitions
- Limit line length to ~100 characters where reasonable

### Module Structure
All Lua modules must follow this pattern:
```lua
local M = {}

-- Public functions
function M.get()
    -- implementation
end

return M
```

For the main module (init.lua):
```lua
---@type Reppuccin
local M = {
    -- module fields
}

function M.setup()
    -- implementation
end

return M
```

### Naming Conventions
| Element | Convention | Example |
|---------|------------|---------|
| Modules | lowercase with underscores | `reppuccin.lib.mapper` |
| Functions | snake_case | `get_palette()`, `apply()` |
| Variables | snake_case | `compile_path`, `path_sep` |
| Constants | UPPERCASE_WITH_UNDERSCORES | Not heavily used; prefer module fields |
| Highlight groups | PascalCase | `ColorColumn`, `LspDiagnosticsDefaultError` |
| Palette colors | lowercase | `base`, `mantle`, `text`, `blue` |
| Options | snake_case | `transparent_background`, `no_italic` |
| Integration names | snake_case (file/module), camelCase (config keys) | `nvimtree.lua`, `integrations.nvimtree` |

### Global Variables
The following globals are used within module contexts (not at top level):
- `O` - merged options table (from `require("reppuccin").options`)
- `C` - palette table (from `require("reppuccin.palette").get_palette()`)
- `U` - utilities table (from `require("reppuccin.utils.colors")`)
- `h` - shorthand for `vim.api.nvim_set_hl` (in compiled output)

Always access these via local scope or require them fresh in each function.

### Imports and Dependencies
- Use `require` for all internal modules
- Avoid `package.loaded` manipulation except in the compile command
- Use `vim.tbl_deep_extend` for merging tables (use "keep" for defaults, "force" for overrides)
- Use `pcall(require, ...)` for optional integrations

### EmmyLua Annotations
Use type annotations for public APIs:
```lua
---@type Reppuccin
local M = {}

---@param user_conf ReppuccinOptions?
function M.setup(user_conf)
    -- implementation
end
```

### Highlight Group Definitions
Structure highlight groups as tables returned by `get()`:
```lua
function M.get()
    return {
        GroupName = { fg = C.color, bg = C.surface0, style = { "bold" } },
        AnotherGroup = { link = "ExistingGroup" },
        ConditionalGroup = condition and { fg = C.color } or { link = "Default" },
    }
end
```

When style arrays are used, handle them like this:
```lua
if color.style then
    for _, style in pairs(color.style) do
        color[style] = true
    end
end
color.style = nil
```

### Palette Structure
Define all colors in `palette.lua`:
```lua
function M.get_palette()
    return {
        base = "#1F1F28",
        mantle = "#16161D",
        text = "#c8c3a6",
        -- ... other colors
    }
end
```

### Error Handling
- Use `pcall` for optional dependencies
- Log errors with `vim.notify(message, vim.log.levels.ERROR)`
- For compilation errors, write debug output to a file and print the path
- Use `assert` for file operations that must succeed

### Conditionals and Options
- Use ternary-style patterns: `condition and value or fallback`
- Merge user config with defaults using `vim.tbl_deep_extend("keep", user_conf, defaults)`
- Check for enabled integrations: `if O.integrations.name == true then ... end`

### File Organization
```
lua/reppuccin/
├── init.lua                    # Main module, setup(), load()
├── palette.lua                 # Color definitions
├── groups.lua                  # (empty/placeholder)
├── groups/
│   ├── editor.lua              # Editor UI highlights
│   ├── lsp.lua                 # LSP diagnostics and semantic tokens
│   ├── syntax.lua              # Basic syntax highlights
│   ├── treesitter.lua          # Treesitter-based highlights
│   ├── semantic_tokens.lua     # LSP semantic tokens
│   ├── terminal.lua            # Terminal colors
│   └── integrations/           # Plugin-specific highlights
│       ├── telescope.lua
│       ├── cmp.lua
│       └── ... (other integrations)
├── lib/
│   ├── compiler.lua            # Compiles theme to bytecode
│   └── mapper.lua              # Applies and merges all highlight groups
└── utils/
    └── colors.lua              # Color utility functions
```

### Integration Pattern
Integrations should follow this structure:
```lua
local M = {}

function M.get()
    return {
        PluginHighlight = { fg = C.blue, bg = C.mantle },
        -- ... other highlights
    }
end

return M
```

Load integrations via `pcall` and only include if enabled:
```lua
local ok, result = pcall(require, "reppuccin.groups.integrations." .. integration)
if ok and result.get and cot then
    final_integrations = vim.tbl_deep_extend("force", final_integrations, result.get())
end
```

### Neovim API Usage
- Use `vim.api.nvim_set_hl(0, name, { ... })` for setting highlights
- Use `vim.api.nvim_create_user_command` for commands
- Use `vim.api.nvim_create_autocmd` for auto-commands
- Use `vim.tbl_deep_extend` for table merging
- Use `vim.notify` for messaging
- Use `vim.fn.*` for Vim functions

### Compatibility
- Target Neovim >= 0.8 (per README)
- The codebase may use some LuaJIT features (check `jit` usage in init.lua)
- Use `vim.fn.has "nvim"` checks for version-specific code

## Testing Guidelines

Since there is no automated test suite:
1. Verify compilation works with `:ReppuccinCompile`
2. Check highlight groups load correctly with `:Inspect`
3. Test with a minimal config to isolate issues
4. Test each integration separately by enabling one at a time
5. Test both light and dark backgrounds if applicable

## Debugging Tips

1. Set `g:reppuccin_debug = 1` to write compiled Lua source to cache
2. Check the compiled output at `stdpath("cache")/reppuccin/reppuccin.lua`
3. Use `:hi GroupName` to inspect individual highlight groups
4. Use `:Telescope highlights` to browse all loaded highlights

## Common Patterns

### Path Separator
```lua
M.path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)
```

### Conditional Highlighting
```lua
CursorLine = { bg = O.transparent_background and C.none or C.mantle },
```

### Deep Merge with Defaults
```lua
M.options = vim.tbl_deep_extend("keep", user_conf, M.default_options)
```

### Optional Integration Loading
```lua
local ok, result = pcall(require, "reppuccin.groups.integrations." .. integration)
if ok and result.get and cot then
    -- use result.get()
end
```

## References

- [Neovim Lua API](https://neovim.io/doc/user/lua.html)
- [catppuccin/nvim](https://github.com/catppuccin/nvim) - original project
- [EmmyLua Annotations](https://github.com/LuaLS/lua-language-server/wiki/EmmyLua-Annotations)
