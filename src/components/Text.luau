local Theme = require(script.Parent.Parent.App.Theme)
local Fusion = require(script.Parent.Parent.packages.Fusion)
local types = require(script.Parent.Parent.types)

type UsedAs<T> = Fusion.UsedAs<T>

type TextProps = {
	text: UsedAs<string>,
	textSize: UsedAs<number>?,
	textColor: UsedAs<Color3>?,
	fontWeight: Enum.FontWeight?,
	textXAlignment: UsedAs<Enum.TextXAlignment>?,
	textYAlignment: UsedAs<Enum.TextYAlignment>?,
} & types.BaseComponentProps

local function Text(scope: Fusion.Scope<typeof(Fusion)>, props: TextProps)
	local scope = scope:innerScope({
		Theme = Theme,
	})

	return scope:New "TextLabel" {
		BackgroundTransparency = 1,
		Position = props.position,
		AnchorPoint = props.anchorPoint,
		Size = props.size or UDim2.fromScale(1, 0),
		AutomaticSize = props.automaticSize or Enum.AutomaticSize.Y,

		Text = props.text,
		TextWrapped = true,
		RichText = true,
		TextSize = props.textSize or 16,
		TextColor3 = props.textColor or scope:Theme "text",
		FontFace = Font.fromName("Montserrat", props.fontWeight or Enum.FontWeight.Medium),
		TextXAlignment = props.textXAlignment or Enum.TextXAlignment.Left,
		TextYAlignment = props.textYAlignment,
	}
end

return Text
