WinState = BaseState:extend()


--[[ 
    WinState constructor
    create "win" choice box
]]
function WinState:new()
    self.choiceBox = ChoiceBox('win')
end 


--[[ 
    draw win state
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
    update win state
]]
function WinState:update(state)
    self.choiceBox:update()
end 

