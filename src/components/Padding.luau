local Fusion = require(script.Parent.Parent.packages.Fusion)

type UsedAs<T> = Fusion.UsedAs<T>

local function Padding(
	scope: Fusion.Scope<typeof(Fusion)>,
	paddingTop: UsedAs<UDim>?,
	paddingLeft: UsedAs<UDim>?,
	paddingBottom: UsedAs<UDim>?,
	paddingRight: UsedAs<UDim>?
)
	return scope:New "UIPadding" {
		PaddingTop = paddingTop or UDim.new(0, 8),
		PaddingLeft = paddingLeft or paddingTop or UDim.new(0, 8),
		PaddingBottom = paddingBottom or paddingTop or UDim.new(0, 8),
		PaddingRight = paddingRight or paddingLeft or paddingTop or UDim.new(0, 8),
	}
end

return Padding
