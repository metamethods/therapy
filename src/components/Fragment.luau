local Frame = require(script.Parent.Frame)
local List = require(script.Parent.List)
local Fusion = require(script.Parent.Parent.packages.Fusion)

local Children = Fusion.Children

type FragmentProps = {} & List.ListProps & Frame.FrameProps

local function Fragment(scope: Fusion.Scope<typeof(Fusion)>, props: FragmentProps)
	local scope = scope:deriveScope({
		Frame = Frame,
		List = List,
	})

	return scope:Frame {
		backgroundColor = props.backgroundColor,
		backgroundTransparency = props.backgroundTransparency or 1,
		position = props.position,
		anchorPoint = props.anchorPoint,
		size = props.size or UDim2.fromScale(1, 0),
		automaticSize = props.automaticSize or Enum.AutomaticSize.Y,
		layoutOrder = props.layoutOrder,

		[Children] = {
			scope:List {
				padding = props.padding,
				direction = props.direction,
				horizontalAlignment = props.horizontalAlignment,
				horizontalFlex = props.horizontalFlex,
				verticalAlignment = props.verticalAlignment,
				verticalFlex = props.verticalFlex,
				sortOrder = props.sortOrder,
				wraps = props.wraps,
			},

			props[Children],
		},
	}
end

return Fragment
