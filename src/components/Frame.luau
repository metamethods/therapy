local Fusion = require(script.Parent.Parent.packages.Fusion)
local types = require(script.Parent.Parent.types)

local Children = Fusion.Children

type UsedAs<T> = Fusion.UsedAs<T>

export type FrameProps = {
	backgroundColor: UsedAs<Color3>?,
	backgroundTransparency: UsedAs<number>?,
} & types.BaseComponentProps

local function Frame(scope: Fusion.Scope<typeof(Fusion)>, props: FrameProps)
	return scope:New "Frame" {
		BackgroundColor3 = props.backgroundColor,
		BackgroundTransparency = props.backgroundTransparency,
		Position = props.position,
		AnchorPoint = props.anchorPoint,
		Size = props.size,
		AutomaticSize = props.automaticSize,
		LayoutOrder = props.layoutOrder,

		[Children] = props[Children],
	}
end

return Frame
