GameOverState = BaseState:extend()

--[[ 
    GameOverState constructor
    create "lose" choice box
]]
function GameOverState:new()
    self.choiceBox = ChoiceBox('lose')
end 


--[[ 
    draw game over state
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
    update game over state
]]
function GameOverState:update(state)
    self.choiceBox:update()
end 

