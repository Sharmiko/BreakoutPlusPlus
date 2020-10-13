GameOverState = BaseState:extend()

--[[ 
    
]]
function GameOverState:new()
    self.text = Text(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 
        "You Lost!", 24)
end 


--[[ 

]]
function GameOverState:draw()
    gBall:draw()
    gPaddle:draw()
    gBricks:draw()
    gHeart:draw()
    love.graphics.setColor(194/255, 20/255, 8/255)
    self.text:draw()
end 


--[[
    
]]
function GameOverState:update(state)

end 

