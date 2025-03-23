local App = require(script.App)
local Toolbar = require(script.components.plugin.Toolbar)
local ToolbarButton = require(script.components.plugin.ToolbarButton)
local Widget = require(script.components.plugin.Widget)
local constants = require(script.constants)
local Fusion = require(script.packages.Fusion)

local scoped = Fusion.scoped

local scope = scoped(Fusion)

local toolbar = Toolbar(plugin, `{constants.PLUGIN_NAME} {constants.PLUGIN_VERSION}`)

local appWidget = Widget(plugin) {
	id = constants.PLUGIN_ID,
	title = `{constants.PLUGIN_NAME} {constants.PLUGIN_VERSION}`,
	root = App(scope:deriveScope({
		plugin = plugin,
	})),
}

ToolbarButton(toolbar) {
	id = constants.PLUGIN_NAME,
	icon = "http://www.roblox.com/asset/?id=111803379230074",
	tooltip = `Click to toggle {constants.PLUGIN_NAME}`,
	clicked = function()
		appWidget.Enabled = not appWidget.Enabled
	end,
}
