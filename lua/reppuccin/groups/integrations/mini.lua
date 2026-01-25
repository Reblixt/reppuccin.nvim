local M = {}

function M.get()
    return {
        MiniStatuslineFilename = { fg = C.text, bg = C.base },
        MiniStatuslineDirectory = { fg = C.text, bg = C.base },
        MiniStatuslineFileModified = { fg = C.peach, bg = C.base },
        MiniStatuslineModeNormal = { fg = C.text, bg = C.blue },
        MiniStatuslineModeInsert = { fg = C.text, bg = C.green },
        MiniStatuslineModeVisual = { fg = C.text, bg = C.peach },
        MiniStatuslineModeCommand = { fg = C.text, bg = C.red },
        MiniStatuslineModeReplace = { fg = C.text, bg = C.mauve },
        MiniStatuslineInactive = { fg = C.overlay1, bg = C.surface0 },
    }
end

return M