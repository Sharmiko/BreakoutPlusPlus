AboutState = BaseState:extend()

--[[ 
    Options state constructor
]]
function AboutState:new()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    self.text = Text(width / 2, height / 2, "About coming soon...", 32)
    self.backButton = Button(25, 25, 100, 40, "< back", {99, 96, 88}, 18, 0,
        function() stateMachine:change('menu') end)
end 


--[[ 
    Function that draws options
]]
function AboutState:draw()
    self.text:draw()
    self.backButton:draw()
end 


--[[
    Function that updates state of options menu
]]
function AboutState:update(state)
    self.backButton:update()
end 

