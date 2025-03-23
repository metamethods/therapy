local Fusion = require(script.Parent.Parent.packages.Fusion)
local studioTheme = require(script.Parent.Parent.stores.studioTheme)

type ThemeColor = "base" | "medium" | "top" | "accent" | "text" | "subtext"
type Theme = { [ThemeColor]: Color3 }

local themes: { dark: Theme, light: Theme } = {
	dark = {
		base = Color3.fromHex("#111117"),
		medium = Color3.fromHex("#191920"),
		top = Color3.fromHex("#1F1F28"),
		accent = Color3.fromHex("#8D74FF"),
		text = Color3.fromHex("#CFD3FA"),
		subtext = Color3.fromHex("#9B9FC0"),
	},
	light = {},
}

local function Theme(scope: Fusion.Scope<typeof(Fusion)>, color: ThemeColor): Fusion.Computed<Color3>
	return scope:Computed(function(use)
		return themes[use(studioTheme)][color]
	end)
end

return Theme
