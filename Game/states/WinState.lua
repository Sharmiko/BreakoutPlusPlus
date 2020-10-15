WinState = BaseState:extend()

--[[ 
    
]]
function WinState:new()
    self.choiceBox = ChoiceBox('win')
end 


--[[ 

]]
function WinState:draw()
    gInfoBar:draw()
    gBall:draw()
    gPaddle:draw()
    gBricks:draw()
    gHeart:draw()
    self.choiceBox:draw()
end 


--[[
    
]]
function WinState:update(state)
    self.choiceBox:update()
end 

