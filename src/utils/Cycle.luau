local Cycle = {}
Cycle.__index = Cycle

function Cycle.new<T>(items: { T }): Cycle<T>
	return setmetatable({
		items = items,
		index = 0,
	}, Cycle) :: Cycle<T>
end

function Cycle.next<T>(self: Cycle<T>): T
	self.index = (self.index + 1) % #self.items
	return self.items[self.index + 1]
end

function Cycle.peek<T>(self: Cycle<T>, offset: number?): T
	return self.items[((self.index + (offset or 0)) % #self.items) + 1]
end

export type Cycle<T> = typeof(setmetatable(
	{} :: {
		items: { T },
		index: number,
	},
	Cycle
))

return Cycle
