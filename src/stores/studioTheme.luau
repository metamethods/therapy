local Fusion = require(script.Parent.Parent.packages.Fusion)

local scoped = Fusion.scoped

local scope = scoped({ Value = Fusion.Value })

local studio = settings():GetService("Studio")
local studioTheme: Fusion.Value<"light" | "dark"> = scope:Value(studio.Theme.Name:lower())

studio.ThemeChanged:Connect(function()
	studioTheme:set(studio.Theme.Name:lower())
end)

return studioTheme
