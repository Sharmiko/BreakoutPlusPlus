OptionsState = BaseState:extend()


--[[ 
    Options state constructor
]]
function OptionsState:new()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    self.text = Text(width / 2, height / 2, "Options coming soon...", 32)
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0,
        function() stateMachine:change('menu') end)
end 


--[[ 
    Function that draws options
]]
function OptionsState:draw()
    self.text:draw()
    self.backButton:draw()
end 


--[[
    Function that updates state of options menu
]]
function OptionsState:update(state)
    self.backButton:update()
end 

