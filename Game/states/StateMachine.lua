StateMachine = Object:extend()


function StateMachine:new(states)
	self.empty = {
		render = function() end,
		update = function() end,
		enter = function() end,
		exit = function() end
	}
	self.states = states or {}
	self.current = self.empty
end


function StateMachine:change(stateName, enterParams)
	assert(self.states[stateName])
	self.current:exit()
	self.current = self.states[stateName]()
	self.current:enter(enterParams)
end


function StateMachine:update(dt)
	self.current:update(dt)
end


function StateMachine:draw()
	self.current:render()
end
