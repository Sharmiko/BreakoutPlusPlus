ServeState = BaseState:extend()


--[[ 
    Serve state constructor
]]
function ServeState:new()
    self.text = Text(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 
        "Press 'space' to serve the ball!", 24)
end 


--[[
    initialize bricks when these state is loaded
]]
function ServeState:enter(bricks)
    gBricks = bricks 
end 


--[[ 
    draw serve state
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
    update serve state 
]]
function ServeState:update(dt)
    if love.keyboard.isDown('space')
    then
        stateMachine:change('play')
    end 
    gPaddle:update(dt)
    gInfoBar:update()
    gBall.x = gPaddle.x  + (gPaddle.width / 2) - 4
    gBall.y = gPaddle.y - 9
    self.text:update()
end 

