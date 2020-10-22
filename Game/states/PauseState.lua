PauseState = BaseState:extend()

--[[ 
    GameOverState constructor
    create "pause" choice box
]]
function PauseState:new()
    self.choiceBox = ChoiceBox('pause')
end 


--[[ 
    Draw Pause state
]]
function PauseState:draw()
    gInfoBar:draw()
    gBall:draw()
    gPaddle:draw()
    gBricks:draw()
    gHeart:draw()
    self.choiceBox:draw()
end 


--[[
    Update Pause state
]]
function PauseState:update(state)
    self.choiceBox:update()
end 

