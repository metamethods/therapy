local Fusion = require(script.Parent.packages.Fusion)

type UsedAs<T> = Fusion.UsedAs<T>

export type AppScope<T = {}> = Fusion.Scope<typeof(Fusion) & T & {
	plugin: Plugin,
}>

export type BaseComponentProps = {
	position: UsedAs<UDim2>?,
	anchorPoint: UsedAs<Vector2>?,
	size: UsedAs<UDim2>?,
	automaticSize: UsedAs<Enum.AutomaticSize>?,
	layoutOrder: UsedAs<number>?,
	[typeof(Fusion.Children)]: Fusion.Child?,
}

return {}
