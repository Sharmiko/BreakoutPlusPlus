GameOverState = BaseState:extend()

--[[ 
    
]]
function GameOverState:new()
    local buttonList = {}
    self.backToMenuButton = Button(nil, nil, 140, 70, "< back to Menu!", {1, 1, 1}, 16, 0)
    self.restartButton = Button(nil, nil, 140, 70, "Restart!", {1, 1, 1}, 16, 0)
    table.insert(buttonList, self.backToMenuButton)
    table.insert(buttonList, self.restartButton)
    self.choiceBox = ChoiceBox("You Lost!", {217, 22, 22}, buttonList)
end 


--[[ 

]]
function GameOverState:draw()
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

