local pesde = require(script.Parent.pesde)

return {
	PLUGIN_NAME = "Therapy",
	PLUGIN_ID = pesde.name:match("/(.*)"),
	PLUGIN_VERSION = pesde.version,
}
