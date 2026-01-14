local M = {}

local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
	return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

function M.darken(hex, amount, bg)
	local r, g, b = hex_to_rgb(hex)
	local br, bg_col, bb = hex_to_rgb(bg or "#000000")

	r = r - (r - br) * amount
	g = g - (g - bg_col) * amount
	b = b - (b - bb) * amount

	return rgb_to_hex(r, g, b)
end

function M.lighten(hex, amount, bg)
	local r, g, b = hex_to_rgb(hex)
	local br, bg_col, bb = hex_to_rgb(bg or "#ffffff")

	r = r + (br - r) * amount
	g = g + (bg_col - g) * amount
	b = b + (bb - b) * amount

	return rgb_to_hex(r, g, b)
end

function M.blend(foreground, background, alpha)
	local fr, fg, fb = hex_to_rgb(foreground)
	local br, bg, bb = hex_to_rgb(background)

	local r = (fr * alpha + br * (1 - alpha))
	local g = (fg * alpha + bg * (1 - alpha))
	local b = (fb * alpha + bb * (1 - alpha))

	return rgb_to_hex(r, g, b)
end

function M.vary_color(col_tbl, default)
	local col = default
	for key, value in pairs(col_tbl) do
		if key == "latte" or key == "reppuccin" then
			col = value
		end
	end
	return col
end

return M
