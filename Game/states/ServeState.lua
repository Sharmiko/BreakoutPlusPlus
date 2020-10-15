ServeState = BaseState:extend()


--[[ 
    Options state constructor
]]
function ServeState:new()
    self.text = Text(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 
        "Press 'space' to serve the ball!", 24)
end 


function ServeState:enter(bricks)
    gBricks = bricks 
end 

--[[ 
    Function that draws options
]]
function ServeState:draw()
    gInfoBar:draw()
    gHeart:draw()
    gBricks:draw()
    gPaddle:draw()
    gBall:draw()
    self.text:draw()
end 


--[[

]]
function ServeState:update(dt)
    if love.keyboard.isDown('space')
    then
        stateMachine:change('play')
    end 
    gPaddle:update(dt)
    gBall.x = gPaddle.x  + (gPaddle.width / 2) - 4
    gBall.y = gPaddle.y - 9
    self.text:update()
end 

