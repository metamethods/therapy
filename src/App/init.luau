local Frame = require(script.Parent.components.Frame)
local images = require(script.Parent.images)
local Fusion = require(script.Parent.packages.Fusion)
local types = require(script.Parent.types)
local Cycle = require(script.Parent.utils.Cycle)

local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local peek = Fusion.peek

local function randomImage(): string
	return `rbxassetid://{images[math.random(#images)]}`
end

local function App(scope: types.AppScope)
	local scope = scope:deriveScope({
		Frame = Frame,
	})

	local faceCycle = Cycle.new({
		Enum.NormalId.Front,
		Enum.NormalId.Left,
		Enum.NormalId.Back,
		Enum.NormalId.Right,
	})

	local decals: { [Enum.NormalId]: Decal } = {}

	local rotation = scope:Value(0)
	local rotationSpring = scope:Spring(rotation, 5, 0.2)

	local function spin()
		rotation:set(peek(rotation) - 90)
		decals[faceCycle:peek(2)].Texture = randomImage()
		faceCycle:next()
	end

	table.insert(
		scope,
		task.spawn(function()
			while task.wait(10) do
				spin()
			end
		end)
	)

	return scope:New "TextButton" {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[OnEvent "MouseButton1Click"] = spin,
		[Children] = scope:New "ViewportFrame" {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			CurrentCamera = scope:New "Camera" {
				CFrame = CFrame.new(0, 6, -25) * CFrame.Angles(0.3, math.pi, 0),
			},
			[Children] = scope:New "Part" {
				Size = Vector3.new(15, 15, 15),
				Orientation = scope:Computed(function(use)
					return Vector3.new(0, use(rotationSpring), 0)
				end),
				[Children] = scope:ForValues(faceCycle.items, function(_, scope: typeof(scope), face)
					local decal = scope:New "Decal" {
						Face = face,
						Texture = randomImage(),
					}
					decals[face] = decal
					return decal
				end),
			},
		},
	}
end

return App
