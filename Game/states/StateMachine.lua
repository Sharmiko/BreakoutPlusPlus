StateMachine = Object:extend()


--[[
	State machine constructor
	Parameters:
		states (state) - state that can be loaded or unloaded
]]
function StateMachine:new(states)
	self.empty = {
		draw = function() end,
		update = function() end,
		enter = function() end,
		exit = function() end
	}
	self.states = states or {}
	self.current = self.empty
end


--[[
	Function that changes current state
	Paramters:
		stateName (str) - name of the state to change to
		enterParams (obj) - parameters to pass to newly created state
]]
function StateMachine:change(stateName, enterParams)
	assert(self.states[stateName])
	self.current:exit()
	self.current = self.states[stateName]()
	self.current:enter(enterParams)
end


--[[
	update state
]]
function StateMachine:update(dt)
	self.current:update(dt)
end


--[[
	draw state
]]
function StateMachine:draw()
	self.current:draw()
end
