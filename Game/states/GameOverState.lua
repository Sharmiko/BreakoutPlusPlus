GameOverState = BaseState:extend()

--[[ 
    
]]
function GameOverState:new()
    self.choiceBox = ChoiceBox('lose')
end 


--[[ 

]]
function GameOverState:draw()
    gInfoBar:draw()
    gBall:draw()
    gPaddle:draw()
    gBricks:draw()
    gHeart:draw()
    self.choiceBox:draw()
end 


--[[
    
]]
function GameOverState:update(state)
    self.choiceBox:update()
end 

