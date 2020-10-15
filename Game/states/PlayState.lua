PlayState = BaseState:extend()


--[[
    Game object constructor
    - initialize game components:
        paddle, ball and bricks
]]
function PlayState:new()
    self.collisions = Collisions()
end 


--[[
    Draw ball, paddle and bricks on the screen
]]
function PlayState:draw()
    gBall:draw()
    gPaddle:draw()
    gBricks:draw()
    gHeart:draw()
end 


--[[
    Update component information
]]
function PlayState:update(dt)
    gBall:update(dt)
    gPaddle:update(dt)
    self.collisions:ballWallCollision(gBall)
    self.collisions:ballPaddleCollision(gBall, gPaddle)
    self.collisions:ballBricksCollision(gBall, gBricks)

    if gBricks.brickCount == 0
    then
        stateMachine:change('win')
    end 
end 
