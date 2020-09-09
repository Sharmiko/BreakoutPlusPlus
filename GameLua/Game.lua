require "Paddle"
require "Ball"
require "Bricks"


Game = Object:extend()


--[[
    Game object constructor
    - initialize game components:
        paddle, ball and bricks
--]]
function Game:new()
    --self.bricks = Bricks()
    self.paddle = Paddle()
    self.ball = Ball()
    self.bricks = nil 
end 


--[[
    Draw ball, paddle and bricks on the screen
--]]
function Game:draw()
    self.ball:draw()
    self.paddle:draw()
    self.bricks:draw()
end 


--[[
    Update component information
--]]
function Game:update(dt)
    self.ball:update(dt, self.paddle)
    self.paddle:update(dt)
    self.bricks:update()
end 